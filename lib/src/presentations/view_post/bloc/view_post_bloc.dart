import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/common/widgets/custom_alert_dialog.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/share_post_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/use_cases/share_post_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/reply_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/delete_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_comment_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/favourite_post_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/fetch_data_comment_first_level_use_case.dart';
import 'package:jobspot/src/presentations/view_post/domain/use_cases/get_reply_comment_use_case.dart';
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
  final GetReplyCommentUseCase _getReplyCommentUseCase;
  final DeleteCommentUseCase _deleteCommentUseCase;
  final SharePostUseCase _sharePostUseCase;

  final TextEditingController commentController = TextEditingController();
  final FocusNode commentFocusNode = FocusNode();

  StreamSubscription? _postStream;
  String? _postID;
  String? _owner;
  CommentEntity? replyComment;

  ViewPostBloc(
    this._commentFirstLevelUseCase,
    this._favouriteCommentUseCase,
    this._favouritePostUseCase,
    this._sendCommentUseCase,
    this._syncPostDataUseCase,
    this._replyCommentUseCase,
    this._getReplyCommentUseCase,
    this._deleteCommentUseCase,
    this._sharePostUseCase,
  ) : super(ViewPostInitial()) {
    commentController.addListener(() => add(ChangeTextCommentEvent()));

    commentFocusNode.addListener(() {
      if (replyComment != null && !commentFocusNode.hasFocus) {
        add(ReplyCommentClickEvent());
      }
    });

    on<ChangeTextCommentEvent>((_, emit) => emit(ChangeTextCommentState()));

    on<ReplyCommentClickEvent>(_replyCommentClick);

    on<RequestCommentEvent>(_requestComment);

    on<SyncPostDataEvent>(_syncPostData);

    on<SendPostDataEvent>(_sendPostData);

    on<ReplyCommentEvent>(_replyComment);

    on<ViewReplyCommentEvent>(_getReplyComment);

    on<GetListCommentEvent>(_getListComment);

    on<SendCommentEvent>(_sendComment);

    on<FavouritePostEvent>(_favouritePost);

    on<FavouriteCommentEvent>(_favouriteComment);

    on<DeleteCommentEvent>(_deleteComment);

    on<SharePostEvent>(_sharePost);
  }

  void _requestComment(RequestCommentEvent event, _) {
    if (event.isComment) commentFocusNode.requestFocus();
  }

  void _replyCommentClick(ReplyCommentClickEvent event, Emitter emit) {
    if (event.comment != null) commentFocusNode.requestFocus();
    replyComment = event.comment;
    emit(ReplyCommentClickState());
  }

  void _syncPostData(SyncPostDataEvent event, Emitter emitter) {
    if (_postID == null && event.post != null) {
      _postID ??= event.post!.id;
      _owner ??= event.post!.owner;
      add(SendPostDataEvent(event.post!));
      add(GetListCommentEvent(
        listComment: event.post!.comment,
        isLoading: true,
      ));
    }
    _postID ??= event.postID;
    if (_postStream != null) _postStream!.cancel();
    _postStream = _syncPostDataUseCase.call(params: _postID!).listen((event) {
      if (event is DataSuccess) {
        if (event.data != null) {
          _owner ??= event.data!.owner;
          add(GetListCommentEvent(listComment: event.data!.comment));
        }
        add(SendPostDataEvent(event.data));
      }
    });
  }

  void _sendPostData(SendPostDataEvent event, Emitter emit) =>
      emit(SyncPostDataSuccess(event.post));

  Future _getListComment(GetListCommentEvent event, Emitter emit) async {
    if (event.isLoading) emit(GetCommentDataLoading());
    final response =
        await _commentFirstLevelUseCase.call(params: event.listComment);
    if (response is DataSuccess) {
      emit(GetCommentDataSuccess(response.data!));
    } else {
      emit(ViewPostError(response.error ?? ""));
    }
  }

  Future _sendComment(SendCommentEvent event, Emitter emit) async {
    String comment = commentController.text;
    commentController.clear();
    commentFocusNode.unfocus();
    final response = await _sendCommentUseCase.call(
        params: SendCommentEntity(
      owner: _owner ?? "",
      content: comment,
      post: _postID!,
    ));
    if (response is DataFailed) {
      emit(ViewPostError(response.error ?? ""));
    }
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
      uidComment: event.uidComment,
      uidPost: _owner ?? "",
      postID: _postID!,
      commentID: commentID,
      content: comment,
    ));
    if (response is DataSuccess) {
      add(SyncPostDataEvent());
    } else {
      emit(ViewPostError(response.error ?? ""));
    }
  }

  Future _getReplyComment(ViewReplyCommentEvent event, Emitter emit) async {
    emit(ViewReplyCommentLoading(event.commentID));
    final response =
        await _getReplyCommentUseCase.call(params: event.commentID);
    if (response is DataSuccess) {
      emit(ViewReplyCommentSuccess(
        listComment: response.data!,
        commentID: event.commentID,
      ));
    } else {
      emit(ViewPostError(response.error ?? ""));
    }
  }

  Future _favouritePost(FavouritePostEvent event, Emitter emit) async {
    final response = await _favouritePostUseCase.call(
      params: FavouriteEntity(
        id: _postID!,
        listFavourite: event.listFavourist,
        uidTo: _owner ?? "",
      ),
    );
    if (response is DataFailed) {
      emit(ViewPostError(response.error ?? ""));
    }
  }

  Future _favouriteComment(FavouriteCommentEvent event, Emitter emit) async {
    List<String> listFavourite = [...event.listFavourite];
    String uid = FirebaseAuth.instance.currentUser!.uid;
    listFavourite.contains(uid)
        ? listFavourite.remove(uid)
        : listFavourite.add(uid);
    emit(FavouriteCommentLoading(id: event.id, listFavoutite: listFavourite));
    final response = await _favouriteCommentUseCase.call(
        params: FavouriteEntity(
      id: event.id,
      listFavourite: listFavourite,
      uidTo: _owner ?? "",
    ));
    if (response is DataSuccess) {
      emit(FavouriteCommentSuccess(id: event.id, listFavoutite: listFavourite));
    } else {
      emit(ViewPostError(response.error ?? ""));
    }
  }

  Future _deleteComment(DeleteCommentEvent event, Emitter emit) async {
    final response = await _deleteCommentUseCase.call(params: event.commentID);
    if (response is DataSuccess) {}
  }

  Future _sharePost(SharePostEvent event, Emitter emit) async {
    final response = await _sharePostUseCase.call(params: event.entity);
    if (response is DataSuccess) {
      emit(SharePostSuccess());
    }
  }

  Future showSimpleDialog(BuildContext context, CommentEntity comment) async {
    await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  customToast(
                    context,
                    text: AppLocal.text.save_job_page_feature_not_yet_released,
                  );
                  context.router.pop();
                },
                child: Text(
                  AppLocal.text.view_post_page_send_to_friends,
                  style: AppStyles.boldTextHaiti,
                ),
              ),
              SimpleDialogOption(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(
                      text: "@${comment.user.name}: ${comment.content}"));
                  if (context.mounted) context.router.pop();
                },
                child: Text(
                  AppLocal.text.view_post_page_copy,
                  style: AppStyles.boldTextHaiti,
                ),
              ),
              if (FirebaseAuth.instance.currentUser!.uid == comment.user.id)
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _showAlertDialog(
                      context,
                      onOK: () {
                        add(DeleteCommentEvent(comment.id));
                        context.router.pop();
                      },
                    );
                  },
                  child: Text(
                    AppLocal.text.view_post_page_delete,
                    style: AppStyles.boldTextHaiti,
                  ),
                ),
            ],
          );
        });
  }

  Future _showAlertDialog(
    BuildContext context, {
    required VoidCallback onOK,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return customAlertDialog(
          context,
          title: AppLocal.text.view_post_page_delete_comment,
          content: AppLocal.text.view_post_page_delete_comment_content,
          onAccept: onOK,
        );
      },
    );
  }

  @override
  Future<void> close() {
    if (_postStream != null) _postStream!.cancel();
    commentController.dispose();
    commentFocusNode.dispose();
    return super.close();
  }
}
