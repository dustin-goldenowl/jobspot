part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState({this.listNotification});

  final List<NotificationEntity>? listNotification;

  NotificationState copyWith({List<NotificationEntity>? listNotification}) {
    return NotificationState(
      listNotification: listNotification ?? this.listNotification,
    );
  }

  @override
  List<Object?> get props => [listNotification];
}
