import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/send_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/sync_post_data_use_case.dart';

part 'view_post_state.dart';

@injectable
class ViewPostCubit extends Cubit<ViewPostState> {
  final FetchDataCommentFirstLevelUseCase _commentFirstLevelUseCase;
  final SyncPostDataUseCase _syncPostDataUseCase;
  final SendCommentUseCase _sendCommentUseCase;
  final TextEditingController commentController = TextEditingController();

  StreamSubscription? _postStream;

  ViewPostCubit(
    this._commentFirstLevelUseCase,
    this._syncPostDataUseCase,
    this._sendCommentUseCase,
  ) : super(const ViewPostState());

  void initPost(PostEntity post) {
    syncPostData(post.id);
    getListCommentFirstLevel(post.comment);
    emit(state.copyWith(post: post));
  }

  void syncPostData(String id) {
    if (_postStream != null) _postStream!.cancel();
    _postStream = _syncPostDataUseCase.call(params: id).listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(post: event.data));
        getListCommentFirstLevel(event.data!.comment);
      }
    });
  }

  Future getListCommentFirstLevel(List<String> listID) async {
    final response = await _commentFirstLevelUseCase.call(params: listID);
    if (response is DataSuccess) {
      emit(state.copyWith(litsComment: response.data));
    }
  }

  Future sendComment() async {
    final response = await _sendCommentUseCase.call(
        params: SendCommentEntity(
      content: commentController.text,
      owner: FirebaseAuth.instance.currentUser!.uid,
      post: state.post!.id,
    ));
    if (response is DataSuccess) {
      commentController.clear();
    }
  }

  @override
  Future<void> close() {
    if (_postStream != null) _postStream!.cancel();
    return super.close();
  }
}
