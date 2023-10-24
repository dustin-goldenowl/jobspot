import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';

abstract class NotificationRepository {
  Stream<DataState<List<NotificationEntity>>> streamNotification();

  Future<DataState<bool>> sendNotification(SendNotificationEntity entity);

  Future<DataState<bool>> readNotification(String id);

  Future<DataState<bool>> readAllNotification();

  Future<DataState<bool>> deleteNotificationFromID(String id);

  Future<DataState<bool>> deleteNotification(SendNotificationEntity entity);
}
