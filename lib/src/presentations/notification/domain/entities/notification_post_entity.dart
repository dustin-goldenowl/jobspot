part of 'notification_entity.dart';

class NotificationPostEntity extends NotificationEntity {
  NotificationPostEntity({
    required super.id,
    required super.from,
    required super.type,
    required super.action,
    required super.isRead,
    required super.createAt,
    required PostEntity super.post,
  });
}
