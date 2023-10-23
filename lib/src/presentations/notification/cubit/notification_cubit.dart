import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart';

part 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  StreamSubscription? _notificationSubscription;

  final StreamNotificationUseCase _streamNotificationUseCase;
  final ReadNotificationUseCase _readNotificationUseCase;
  final ReadAllNotificationUseCase _readAllNotificationUseCase;

  NotificationCubit(
    this._streamNotificationUseCase,
    this._readNotificationUseCase,
    this._readAllNotificationUseCase,
  ) : super(const NotificationState()) {
    _getNotification();
  }

  void _getNotification() {
    if (_notificationSubscription != null) _notificationSubscription!.cancel();
    _notificationSubscription =
        _streamNotificationUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listNotification: event.data));
      }
    });
  }

  Future readNotification(String id) async {
    final resposne = await _readNotificationUseCase.call(params: id);
    if (resposne is DataFailed) {}
  }

  Future readAllNotification() async {
    final response = await _readAllNotificationUseCase.call();
    if (response is DataFailed) {}
  }
}
