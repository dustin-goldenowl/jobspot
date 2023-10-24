import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_from_id_use_case.dart';
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
  final DeleteNotificationFromIDUseCase _deleteNotificationUseCase;

  NotificationCubit(
    this._streamNotificationUseCase,
    this._readNotificationUseCase,
    this._readAllNotificationUseCase,
    this._deleteNotificationUseCase,
  ) : super(const NotificationState()) {
    getNotification();
  }

  void getNotification() {
    if (_notificationSubscription != null) _notificationSubscription!.cancel();
    _notificationSubscription =
        _streamNotificationUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listNotification: event.data));
      } else {
        emit(state.copyWith(error: event.error));
      }
    });
  }

  Future readNotification(String id) async {
    final resposne = await _readNotificationUseCase.call(params: id);
    if (resposne is DataFailed) {
      emit(state.copyWith(error: resposne.error));
    }
  }

  Future readAllNotification() async {
    final response = await _readAllNotificationUseCase.call();
    if (response is DataFailed) {
      emit(state.copyWith(error: response.error));
    }
  }

  Future deleteNotification(String id) async {
    final response = await _deleteNotificationUseCase.call(params: id);
    if (response is DataFailed) {
      emit(state.copyWith(error: response.error));
    }
  }

  @override
  Future<void> close() {
    if (_notificationSubscription != null) _notificationSubscription!.cancel();
    return super.close();
  }
}
