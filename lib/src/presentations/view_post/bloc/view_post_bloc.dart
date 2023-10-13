import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/reply_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/reply_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart';

part 'view_post_event.dart';
part 'view_post_state.dart';

@injectable
class ViewPostBloc extends Bloc<ViewPostEvent, ViewPostState> {
  final FetchDataCommentFirstLevelUseCase _commentFirstLevelUseCase;
  final SyncPostDataUseCase _syncPostDataUseCase;
  final SendCommentUseCase _sendCommentUseCase;
  final FavouritePostUseCase _favouritePostUseCase;
  final FavouriteCommentUseCase _favouriteCommentUseCase;
  final ReplyCommentUseCase _replyCommentUseCase;

  final TextEditingController commentController = TextEditingController();

  StreamSubscription? _postStream;
  String? _postID;
  FocusNode commentFocusNode = FocusNode();
  bool isKeyboardVisible = false;
  CommentEntity? replyComment;

  ViewPostBloc(
    this._commentFirstLevelUseCase,
    this._favouriteCommentUseCase,
    this._favouritePostUseCase,
    this._sendCommentUseCase,
    this._syncPostDataUseCase,
    this._replyCommentUseCase,
  ) : super(ViewPostInitial()) {
    commentController.addListener(() => add(ChangeTextCommentEvent()));

    on<ChangeTextCommentEvent>((event, emit) => emit(ChangeTextCommentState()));

    on<ReplyCommentClickEvent>(_replyCommentClick);

    on<SyncPostDataEvent>(_syncPostData);

    on<SendPostDataEvent>(_sendPostData);

    on<ReplyCommentEvent>(_replyComment);

    on<GetListCommentFirstLevelEvent>(_getListCommentFirstLevel);

    on<SendCommentEvent>(_sendComment);

    on<FavouritePostEvent>(_favouritePost);

    on<FavouriteCommentEvent>(_favouriteComment);
  }

  void _replyCommentClick(ReplyCommentClickEvent event, _) {
    commentFocusNode.requestFocus();
    replyComment = event.comment;
  }

  void _syncPostData(SyncPostDataEvent event, Emitter emitter) {
    if (_postID == null && event.post != null) {
      _postID = event.post!.id;
      add(SendPostDataEvent(event.post!));
      add(GetListCommentFirstLevelEvent(event.post!.comment));
    }
    if (_postStream != null) _postStream!.cancel();
    _postStream = _syncPostDataUseCase.call(params: _postID!).listen((event) {
      if (event is DataSuccess) {
        add(SendPostDataEvent(event.data!));
        add(GetListCommentFirstLevelEvent(event.data!.comment));
      }
    });
  }

  void _sendPostData(SendPostDataEvent event, Emitter emit) =>
      emit(SyncPostDataSuccess(event.post));

  Future _getListCommentFirstLevel(
      GetListCommentFirstLevelEvent event, Emitter emit) async {
    final response =
        await _commentFirstLevelUseCase.call(params: event.listComment);
    if (response is DataSuccess) {
      emit(GetCommentDataSuccess(response.data!));
    }
  }

  Future _sendComment(SendCommentEvent event, Emitter emit) async {
    String comment = commentController.text;
    commentController.clear();
    commentFocusNode.unfocus();
    final response = await _sendCommentUseCase.call(
        params: SendCommentEntity(
      content: comment,
      post: _postID!,
    ));
    if (response is DataSuccess) {}
  }

  Future _replyComment(ReplyCommentEvent event, Emitter emit) async {
    String comment = commentController.text;
    String commentID = replyComment!.id;
    replyComment = null;
    commentController.clear();
    commentFocusNode.unfocus();
    emit(ChangeTextCommentState());
    final response = await _replyCommentUseCase.call(
        params: ReplyCommentEntity(
      postID: _postID!,
      commentID: commentID,
      content: comment,
    ));
    if (response is DataSuccess) {
      add(SyncPostDataEvent());
    }
  }

  Future _favouritePost(FavouritePostEvent event, Emitter emit) async {
    final response = await _favouritePostUseCase.call(
      params: FavouriteEntity(id: _postID!, listFavourite: event.listFavourist),
    );
    if (response is DataSuccess) {}
  }

  Future _favouriteComment(FavouriteCommentEvent event, Emitter emit) async {
    List<String> listFavourite = [...event.listFavourite];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    listFavourite.contains(uid)
        ? listFavourite.remove(uid)
        : listFavourite.add(uid);
    emit(FavouriteCommentLoading(id: event.id, listFavoutite: listFavourite));
    final response = await _favouriteCommentUseCase.call(
        params: FavouriteEntity(id: event.id, listFavourite: listFavourite));
    if (response is DataSuccess) {
      emit(FavouriteCommentSuccess(id: event.id, listFavoutite: listFavourite));
    }
  }

  @override
  Future<void> close() {
    if (_postStream != null) _postStream!.cancel();
    commentController.dispose();
    commentFocusNode.dispose();
    return super.close();
  }
}
