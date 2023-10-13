import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_post/data/models/comment_model.dart';
import 'package:jobspot/src/presentations/view_post/data/models/reply_comment_model.dart';
import 'package:jobspot/src/presentations/view_post/data/models/send_comment_model.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/favourite_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/reply_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/entities/send_comment_entity.dart';
import 'package:jobspot/src/presentations/view_post/domain/repositories/view_post_repository.dart';

@LazySingleton(as: ViewPostRepository)
class ViewPostRepositoryImpl extends ViewPostRepository {
  @override
  Future<DataState<List<CommentEntity>>> getCommentFirstLevel(
      List<String> listComment) async {
    try {
      final response = await Future.wait(listComment
          .map((e) =>
              FirebaseFirestore.instance.collection("comments").doc(e).get())
          .toList());
      List<CommentModel> comments =
          response.map((e) => CommentModel.fromSnapshot(e)).toList();
      final listUser = await getListUser(comments);
      comments = comments
          .map(
            (e) => e.copyWith(
              user: listUser.firstWhere((element) => element.id == e.owner),
            ),
          )
          .toList();
      return DataSuccess(comments.map((e) => e.toCommentEntity()).toList());
    } catch (e) {
      print(e.toString());
      return DataFailed(e.toString());
    }
  }

  Future<List<UserModel>> getListUser(List<CommentModel> datas) async {
    Set<String> listUserId = {};
    for (var data in datas) {
      listUserId.add(data.owner);
    }
    final userData = await Future.wait(listUserId
        .map((id) =>
            FirebaseFirestore.instance.collection("users").doc(id).get())
        .toList());
    return userData.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }

  @override
  Stream<DataState<PostEntity>> syncPostData(String id) {
    try {
      return FirebaseFirestore.instance
          .collection("posts")
          .doc(id)
          .snapshots()
          .asyncMap((event) async {
        PostModel postModel = PostModel.fromDocumentSnapshot(event);
        final user = await FirebaseFirestore.instance
            .collection("users")
            .doc(postModel.owner)
            .get();
        postModel =
            postModel.copyWith(user: UserModel.fromDocumentSnapshot(user));
        return DataSuccess(postModel.toPostEntity());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  @override
  Future<DataState<bool>> sendComment(SendCommentEntity comment) async {
    try {
      final commentStore =
          FirebaseFirestore.instance.collection("comments").doc();
      final postStore =
          FirebaseFirestore.instance.collection("posts").doc(comment.post);
      final commentModel = SendCommentModel.fromEntity(comment);
      final response = await Future.wait([
        commentStore.set(commentModel.toJson()),
        postStore.get(),
      ]);
      final snapshot = response.last as DocumentSnapshot<Map<String, dynamic>>;
      List<String> comments =
          List<String>.from(snapshot.data()!["comment"].map((x) => x));
      await postStore.update({
        "comment": [...comments, commentStore.id]
      });
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> favouritePost(FavouriteEntity favourite) async {
    try {
      List<String> listFavourite = [...favourite.listFavourite];
      if (favourite.listFavourite
          .contains(FirebaseAuth.instance.currentUser!.uid)) {
        listFavourite.remove(FirebaseAuth.instance.currentUser!.uid);
      } else {
        listFavourite.add(FirebaseAuth.instance.currentUser!.uid);
      }
      await FirebaseFirestore.instance
          .collection("posts")
          .doc(favourite.id)
          .update({"like": listFavourite});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> favouriteComment(FavouriteEntity favourite) async {
    try {
      await FirebaseFirestore.instance
          .collection("comments")
          .doc(favourite.id)
          .update({"like": favourite.listFavourite});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> replyComment(ReplyCommentEntity comment) async {
    try {
      final commentStore = FirebaseFirestore.instance
          .collection("comments")
          .doc(comment.commentID);
      final replyCommentStore =
          FirebaseFirestore.instance.collection("comments").doc();
      final replyCommentModel = ReplyCommentModel.fromEntity(comment);
      final response = await Future.wait([
        replyCommentStore.set(replyCommentModel.toJson()),
        commentStore.get(),
      ]);
      final snapshot = response.last as DocumentSnapshot<Map<String, dynamic>>;
      List<String> listReply =
          List<String>.from(snapshot.data()!["reply"].map((x) => x));
      await commentStore.update({
        "reply": [...listReply, replyCommentStore.id]
      });
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
