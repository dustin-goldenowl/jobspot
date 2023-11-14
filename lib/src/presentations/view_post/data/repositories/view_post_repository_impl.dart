import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/use_cases/get_list_user_use_case.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/send_notification_use_case.dart';
import 'package:jobspot/src/presentations/view_post/data/models/comment_model.dart';
import 'package:jobspot/src/presentations/view_post/data/models/reply_comment_model.dart';
import 'package:jobspot/src/presentations/view_post/data/models/send_comment_model.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/delete_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/reply_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@LazySingleton(as: ViewPostRepository)
class ViewPostRepositoryImpl extends ViewPostRepository {
  final SendNotificationUseCase _sendNotificationUseCase;
  final DeleteNotificationUseCase _deleteNotificationUseCase;
  final GetListUserUseCase _getListUserUseCase;

  ViewPostRepositoryImpl(
    this._sendNotificationUseCase,
    this._deleteNotificationUseCase,
    this._getListUserUseCase,
  );

  @override
  Future<DataState<List<CommentEntity>>> getCommentFirstLevel(
      List<String> listComment) async {
    try {
      final response = await Future.wait(
          listComment.map((e) => XCollection.comment.doc(e).get()).toList());
      List<CommentModel> comments =
          response.map((e) => CommentModel.fromSnapshot(e)).toList();
      final listUser = await _getListUserUseCase.call(
          params: comments.map((e) => e.owner).toSet());
      comments = comments
          .map((e) => e.copyWith(
              user: listUser.firstWhere((element) => element.id == e.owner)))
          .toList();
      return DataSuccess(comments.map((e) => e.toCommentEntity()).toList());
    } catch (e) {
      log(e.toString());
      return DataFailed(e.toString());
    }
  }

  @override
  Stream<DataState<PostEntity?>> syncPostData(String id) {
    try {
      return XCollection.post.doc(id).snapshots().asyncMap((event) async {
        if (event.exists) {
          PostModel postModel = PostModel.fromDocumentSnapshot(event);
          final response = await Future.wait([
            XCollection.user.doc(postModel.owner).get(),
            getSharePost(postModel.sharePostID),
            XCollection.comment.where("post", isEqualTo: id).count().get()
          ]);
          final user = response.first as MapSnapshot;
          final sharePost =
              postModel.sharePostID != null ? response[1] as PostModel : null;
          final numberOfComments = response.last as AggregateQuerySnapshot;
          postModel = postModel.copyWith(
            user: UserModel.fromDocumentSnapshot(user),
            numberOfComments: numberOfComments.count,
            sharePost: sharePost,
          );
          return DataSuccess(postModel.toPostEntity());
        }
        return const DataSuccess(null);
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  Future<PostModel?> getSharePost(String? sharePostID) async {
    if (sharePostID != null) {
      final response = await XCollection.post.doc(sharePostID).get();
      PostModel post = PostModel.fromDocumentSnapshot(response);
      final user = await XCollection.user.doc(post.owner).get();
      return post.copyWith(user: UserModel.fromDocumentSnapshot(user));
    }
    return null;
  }

  @override
  Future<DataState<bool>> sendComment(SendCommentEntity comment) async {
    try {
      final commentStore = XCollection.comment.doc();
      final postStore = XCollection.post.doc(comment.post);
      final commentModel = SendCommentModel.fromEntity(comment);
      final response = await Future.wait([
        commentStore.set(commentModel.toJson()),
        postStore.get(),
      ]);
      final snapshot = response.last as MapSnapshot;
      List<String> comments =
          List<String>.from(snapshot.data()!["comment"].map((x) => x));
      _sendNotificationUseCase.call(
          params: SendNotificationEntity(
        action: comment.post,
        to: comment.owner,
        type: AppTags.comment,
      ));
      await postStore.update({
        "comment": [...comments, commentStore.id]
      });
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> favouritePost(FavouriteEntity favourite) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      List<String> listFavourite = [...favourite.listFavourite];
      if (favourite.listFavourite.contains(uid)) {
        listFavourite.remove(uid);
      } else {
        listFavourite.add(uid);
      }
      await XCollection.post.doc(favourite.id).update({"like": listFavourite});
      final notification = SendNotificationEntity(
        action: favourite.id,
        to: favourite.uidTo,
        type: AppTags.favourite,
      );
      if (listFavourite.contains(uid)) {
        _sendNotificationUseCase.call(params: notification);
      } else {
        _deleteNotificationUseCase.call(params: notification);
      }
      await XCollection.post.doc(favourite.id).update({"like": listFavourite});
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> favouriteComment(FavouriteEntity favourite) async {
    try {
      await XCollection.comment
          .doc(favourite.id)
          .update({"like": favourite.listFavourite});
      final notification = SendNotificationEntity(
        action: favourite.id,
        to: favourite.uidTo,
        type: AppTags.favouriteCmt,
      );
      final uid = FirebaseAuth.instance.currentUser!.uid;
      if (favourite.listFavourite.contains(uid)) {
        _sendNotificationUseCase.call(params: notification);
      } else {
        _deleteNotificationUseCase.call(params: notification);
      }
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> replyComment(ReplyCommentEntity comment) async {
    try {
      final commentStore = XCollection.comment.doc(comment.commentID);
      final replyCommentStore = XCollection.comment.doc();
      final replyCommentModel = ReplyCommentModel.fromEntity(comment);
      final response = await Future.wait([
        replyCommentStore.set(replyCommentModel.toJson()),
        commentStore.get(),
      ]);
      final snapshot = response.last as MapSnapshot;
      List<String> listReply =
          List<String>.from(snapshot.data()!["reply"].map((x) => x));
      String? highLevel = snapshot.data()!["highLevel"];
      _sendNotificationUseCase.call(
          params: SendNotificationEntity(
        action: comment.postID,
        to: comment.uidComment,
        type: AppTags.reply,
      ));
      _sendNotificationUseCase.call(
          params: SendNotificationEntity(
        action: comment.postID,
        to: comment.uidPost,
        type: AppTags.comment,
      ));
      await Future.wait([
        replyCommentStore.update({"highLevel": highLevel ?? comment.commentID}),
        updateReplyCommentHighLevel(
            highLevel: highLevel, id: replyCommentStore.id),
        commentStore.update({
          "reply": [...listReply, replyCommentStore.id]
        }),
      ]);
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future updateReplyCommentHighLevel({
    required String? highLevel,
    required String id,
  }) async {
    if (highLevel != null) {
      final highLevelStore = XCollection.comment.doc(highLevel);
      final response = await highLevelStore.get();
      List<String> listReply =
          List<String>.from(response.data()!["reply"].map((x) => x));
      await highLevelStore.update({
        "reply": [...listReply, id]
      });
    }
  }

  @override
  Future<DataState<List<CommentEntity>>> getReplyComment(String id) async {
    try {
      final snapshot = await XCollection.comment.doc(id).get();
      List<String> listReply =
          List<String>.from(snapshot.data()!["reply"].map((x) => x));
      final response = await Future.wait(
          listReply.map((e) => XCollection.comment.doc(e).get()).toList());

      List<CommentModel> listComment =
          response.map((e) => CommentModel.fromSnapshot(e)).toList();
      final listUser = await _getListUserUseCase.call(
          params: listComment.map((e) => e.owner).toSet());
      listComment = listComment
          .map(
            (e) => e.copyWith(
              user: listUser.firstWhere((element) => element.id == e.owner),
            ),
          )
          .toList();
      return DataSuccess(listComment.map((e) => e.toCommentEntity()).toList());
    } catch (e) {
      log(e.toString());
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteComment(DeleteCommentEntity entity) async {
    try {
      await Future.wait([
        updateListCommentPost(entity),
        updateReplyComment(
            commentID: entity.commentID, replyCommentID: entity.highComment),
        updateReplyComment(
            commentID: entity.commentID, replyCommentID: entity.replyCommentID),
        deleteChildComment(field: "comment", commentID: entity.commentID),
        deleteChildComment(field: "highLevel", commentID: entity.commentID),
        XCollection.comment.doc(entity.commentID).delete(),
      ]);
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future updateReplyComment({
    required String commentID,
    String? replyCommentID,
  }) async {
    if (replyCommentID != null) {
      final docs = XCollection.comment.doc(replyCommentID);
      final response = await docs.get();
      final comment = CommentModel.fromSnapshot(response);
      final list = [...comment.reply];
      list.remove(commentID);
      await docs.update({"reply": list});
    }
  }

  Future updateListCommentPost(DeleteCommentEntity entity) async {
    final response = await XCollection.post.doc(entity.postID).get();
    final post = PostModel.fromDocumentSnapshot(response);
    if (post.comment.contains(entity.commentID)) {
      final list = [...post.comment];
      list.remove(entity.commentID);
      await XCollection.post.doc(entity.postID).update({"comment": list});
    }
  }

  Future deleteChildComment({
    required String field,
    required String commentID,
  }) async {
    final response =
        await XCollection.comment.where(field, isEqualTo: commentID).get();
    await Future.wait(
        response.docs.map((e) => XCollection.comment.doc(e.id).delete()));
  }
}
