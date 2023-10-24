part of 'notification_entity.dart';

class NotificationPostEntity extends NotificationEntity {
  NotificationPostEntity({
    required String id,
    required UserEntity from,
    required String type,
    required String action,
    required bool isRead,
    required DateTime createAt,
    required PostEntity post,
  }) : super(
          action: action,
          createAt: createAt,
          from: from,
          id: id,
          isRead: isRead,
          type: type,
          post: post,
        );
}
