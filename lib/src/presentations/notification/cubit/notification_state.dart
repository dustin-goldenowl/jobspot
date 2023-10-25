part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState({this.listNotification, this.error});

  final List<NotificationEntity>? listNotification;
  final String? error;

  NotificationState copyWith(
      {List<NotificationEntity>? listNotification, String? error}) {
    return NotificationState(
      listNotification: listNotification ?? this.listNotification,
      error: error,
    );
  }

  @override
  List<Object?> get props => [listNotification, error];
}
