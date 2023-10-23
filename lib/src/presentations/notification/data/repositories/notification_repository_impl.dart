import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_messaging_service.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/notification/data/models/notification_model.dart';
import 'package:jobspot/src/presentations/notification/data/models/send_notification_model.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Stream<DataState<List<NotificationEntity>>> streamNotification() {
    try {
      return FirebaseFirestore.instance
          .collection("notifications")
          .where("to", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createAt", descending: true)
          .snapshots()
          .asyncMap((event) async {
        List<NotificationModel> notifications = [];
        for (var element in event.docs) {
          notifications.add(NotificationModel.fromDocumentSnapshot(element));
        }
        final listUser = await getListUser(notifications);
        notifications = notifications
            .map((e) => e.copyWith(
                  fromUser: listUser.firstWhere((item) => item.id == e.from),
                ))
            .toList();
        return DataSuccess(notifications.map((e) => e.toEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }

  Future<List<UserModel>> getListUser(List<NotificationModel> datas) async {
    Set<String> listUserId = {};
    for (var data in datas) {
      listUserId.add(data.from);
    }
    final userData = await Future.wait(listUserId
        .map((id) =>
            FirebaseFirestore.instance.collection("users").doc(id).get())
        .toList());
    return userData.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
  }

  @override
  Future<DataState<bool>> sendNotification(
      SendNotificationEntity entity) async {
    try {
      if (entity.to == FirebaseAuth.instance.currentUser!.uid) {
        return DataSuccess(true);
      }

      final response = await Future.wait([
        FirebaseFirestore.instance.collection("tokens").doc(entity.to).get(),
        FirebaseFirestore.instance
            .collection("notifications")
            .doc()
            .set(SendNotificationModel.fromEntity(entity).toJson()),
      ]);
      FirebaseMessagingService.sendNotification(
        token: (response.first as DocumentSnapshot<Map>).data()?["token"] ?? "",
        body: "body",
      );
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> readNotification(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("notifications")
          .doc(id)
          .update({"isRead": true});
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> readAllNotification() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("notifications")
          .where("to", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      await Future.wait(
          response.docs.map((e) => readNotification(e.id)).toList());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
