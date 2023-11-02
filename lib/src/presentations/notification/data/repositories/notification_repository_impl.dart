import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/app_tags.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/service/firebase_messaging_service.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/notification/data/models/notification_model.dart';
import 'package:jobspot/src/presentations/notification/data/models/send_notification_model.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart';
import 'package:jobspot/src/presentations/view_job/data/models/job_model.dart';
import 'package:jobspot/src/presentations/view_post/data/models/comment_model.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Stream<DataState<List<NotificationEntity>>> streamNotification() {
    try {
      return XCollection.notification
          .where("to", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createAt", descending: true)
          .snapshots()
          .asyncMap((event) async {
        List<NotificationModel> notifications = [];
        for (var element in event.docs) {
          notifications.add(NotificationModel.fromDocumentSnapshot(element));
        }
        final response = await Future.wait([
          getListUser(notifications),
          getListComment(notifications),
          getListJob(notifications),
          getListPost(notifications),
        ]);

        final listUser = response[0] as List<UserModel>;
        final listComment = response[1] as List<CommentModel>;
        final listJob = response[2] as List<JobModel>;
        final listPost = response[3] as List<PostModel>;

        notifications = notifications.map((e) {
          final comments =
              listComment.where((item) => item.id == e.action).toList();
          final posts = listPost.where((item) => item.id == e.action).toList();
          final jobs = listJob.where((item) => item.id == e.action).toList();
          return e.copyWith(
            fromUser: listUser.firstWhere((item) => item.id == e.from),
            comment: comments.isEmpty ? null : comments.first,
            job: jobs.isEmpty ? null : jobs.first,
            post: posts.isEmpty ? null : posts.first,
          );
        }).toList();
        return DataSuccess(notifications.map((e) => e.toEntity()!).toList());
      });
    } catch (e) {
      print(e.toString());
      return Stream.value(DataFailed(e.toString()));
    }
  }

  Future<List<UserModel>> getListUser(List<NotificationModel> datas) async {
    Set<String> listUserId = {};
    for (var data in datas) {
      listUserId.add(data.from);
    }
    final userData = await Future.wait(
        listUserId.map((id) => XCollection.user.doc(id).get()).toList());
    return userData.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }

  Future<List<PostModel>> getListPost(List<NotificationModel> datas) async {
    Set<String> listPostId = {};
    final listTag = [AppTags.favourite, AppTags.comment, AppTags.share];
    for (var data in datas) {
      if (listTag.contains(data.type)) listPostId.add(data.action);
    }
    final userData = await Future.wait(
        listPostId.map((id) => XCollection.post.doc(id).get()).toList());
    return userData.map((e) => PostModel.fromDocumentSnapshot(e)).toList();
  }

  Future<List<JobModel>> getListJob(List<NotificationModel> datas) async {
    Set<String> listJobId = {};
    final listTag = [AppTags.apply, AppTags.accept, AppTags.reject];
    for (var data in datas) {
      if (listTag.contains(data.type)) listJobId.add(data.action);
    }
    final userData = await Future.wait(
        listJobId.map((id) => XCollection.job.doc(id).get()).toList());
    return userData.map((e) => JobModel.fromDocumentSnapshot(e)).toList();
  }

  Future<List<CommentModel>> getListComment(
      List<NotificationModel> datas) async {
    Set<String> listCommentId = {};
    final listTag = [AppTags.favouriteCmt, AppTags.reply];
    for (var data in datas) {
      if (listTag.contains(data.type)) listCommentId.add(data.action);
    }
    final userData = await Future.wait(
        listCommentId.map((id) => XCollection.comment.doc(id).get()).toList());
    return userData.map((e) => CommentModel.fromSnapshot(e)).toList();
  }

  @override
  Future<DataState<bool>> sendNotification(
      SendNotificationEntity entity) async {
    try {
      if (entity.to == FirebaseAuth.instance.currentUser!.uid) {
        return DataSuccess(true);
      }

      final response = await Future.wait([
        XCollection.token.doc(entity.to).get(),
        XCollection.notification
            .doc()
            .set(SendNotificationModel.fromEntity(entity).toJson()),
      ]);
      FirebaseMessagingService.sendNotification(
        action: entity.action,
        type: entity.type,
        token: (response.first as DocumentSnapshot<Map>).data()?["token"] ?? "",
        body: entity.type,
      );
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> readNotification(String id) async {
    try {
      await XCollection.notification.doc(id).update({"isRead": true});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> readAllNotification() async {
    try {
      final response = await XCollection.notification
          .where("to", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      await Future.wait(
          response.docs.map((e) => readNotification(e.id)).toList());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteNotificationFromID(String id) async {
    try {
      await XCollection.notification.doc(id).delete();
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteNotification(
      SendNotificationEntity entity) async {
    try {
      final response = await XCollection.notification
          .where("to", isEqualTo: entity.to)
          .where("from", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("type", isEqualTo: entity.type)
          .where("action", isEqualTo: entity.action)
          .get();
      if (response.docs.isNotEmpty) {
        deleteNotificationFromID(response.docs[0].id);
      }
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateToken(String token) async {
    try {
      await XCollection.token
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"token": token});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
