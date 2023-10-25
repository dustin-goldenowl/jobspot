part of 'notification_entity.dart';

class NotificationCommentEntity extends NotificationEntity {
  NotificationCommentEntity({
    required super.id,
    required super.from,
    required super.type,
    required super.action,
    required super.isRead,
    required super.createAt,
    required CommentEntity super.comment,
  });
}
