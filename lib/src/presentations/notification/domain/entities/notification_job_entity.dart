part of 'notification_entity.dart';

class NotificationJobEntity extends NotificationEntity {
  NotificationJobEntity({
    required String id,
    required UserEntity from,
    required String type,
    required String action,
    required bool isRead,
    required DateTime createAt,
    required JobEntity job,
  }) : super(
          action: action,
          createAt: createAt,
          from: from,
          id: id,
          isRead: isRead,
          type: type,
          job: job,
        );
}
