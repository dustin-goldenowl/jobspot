part of 'notification_entity.dart';

class NotificationCommentEntity extends NotificationEntity {
  NotificationCommentEntity({
    required String id,
    required UserEntity from,
    required String type,
    required String action,
    required bool isRead,
    required DateTime createAt,
    required CommentEntity comment,
  }) : super(
          action: action,
          createAt: createAt,
          from: from,
          id: id,
          isRead: isRead,
          type: type,
          comment: comment,
        );
}
