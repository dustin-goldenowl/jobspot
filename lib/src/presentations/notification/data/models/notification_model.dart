import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String id;
  final String from;
  final UserModel? fromUser;
  final String type;
  final String action;
  final bool isRead;
  final DateTime createAt;
  final DateTime updateAt;

  NotificationModel({
    required this.id,
    required this.isRead,
    required this.from,
    this.fromUser,
    required this.type,
    required this.action,
    required this.createAt,
    required this.updateAt,
  });

  factory NotificationModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return NotificationModel(
      id: snapshot.id,
      isRead: data["isRead"],
      from: data["from"],
      type: data["type"],
      action: data["action"],
      createAt: (data["createAt"] as Timestamp).toDate(),
      updateAt: (data["updateAt"] as Timestamp).toDate(),
    );
  }

  NotificationModel copyWith({UserModel? fromUser}) {
    return NotificationModel(
      id: id,
      isRead: isRead,
      from: from,
      type: type,
      action: action,
      createAt: createAt,
      updateAt: updateAt,
      fromUser: fromUser,
    );
  }

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      isRead: isRead,
      from: fromUser!.toUserEntity(),
      type: type,
      action: action,
      createAt: createAt,
      updateAt: updateAt,
    );
  }
}
