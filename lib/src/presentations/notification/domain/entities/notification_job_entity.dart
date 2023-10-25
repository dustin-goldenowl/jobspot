part of 'notification_entity.dart';

class NotificationJobEntity extends NotificationEntity {
  NotificationJobEntity({
    required super.id,
    required super.from,
    required super.type,
    required super.action,
    required super.isRead,
    required super.createAt,
    required JobEntity super.job,
  });
}
