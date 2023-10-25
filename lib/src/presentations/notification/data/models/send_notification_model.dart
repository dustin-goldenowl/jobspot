import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';

class SendNotificationModel {
  final String to;
  final String type;
  final String action;

  SendNotificationModel({
    required this.action,
    required this.to,
    required this.type,
  });

  factory SendNotificationModel.fromEntity(SendNotificationEntity entity) {
    return SendNotificationModel(
      action: entity.action,
      to: entity.to,
      type: entity.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "from": FirebaseAuth.instance.currentUser!.uid,
      "to": to,
      "type": type,
      "action": action,
      "isRead": false,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
