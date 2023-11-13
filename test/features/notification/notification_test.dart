import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/notification/cubit/notification_cubit.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/delete_notification_from_id_use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_all_notification_use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/read_notification_use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/stream_notification_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'notification_test.mocks.dart';

@GenerateMocks([
  StreamNotificationUseCase,
  ReadNotificationUseCase,
  ReadAllNotificationUseCase,
  DeleteNotificationFromIDUseCase,
])
void main() {
  late NotificationCubit notificationCubit;
  late MockStreamNotificationUseCase mockStreamNotificationUseCase;
  late MockReadNotificationUseCase mockReadNotificationUseCase;
  late MockReadAllNotificationUseCase mockReadAllNotificationUseCase;
  late MockDeleteNotificationFromIDUseCase mockDeleteNotificationFromIDUseCase;

  setUp(() {
    mockDeleteNotificationFromIDUseCase = MockDeleteNotificationFromIDUseCase();
    mockReadAllNotificationUseCase = MockReadAllNotificationUseCase();
    mockReadNotificationUseCase = MockReadNotificationUseCase();
    mockStreamNotificationUseCase = MockStreamNotificationUseCase();
    notificationCubit = NotificationCubit(
      mockStreamNotificationUseCase,
      mockReadNotificationUseCase,
      mockReadAllNotificationUseCase,
      mockDeleteNotificationFromIDUseCase,
    );
  });

  group("Test Notification", () {
    blocTest<NotificationCubit, NotificationState>(
      'Test Stream Notification',
      setUp: () {
        when(mockStreamNotificationUseCase.call())
            .thenAnswer((_) => Stream.value(const DataSuccess([])));
      },
      build: () => notificationCubit,
      act: (bloc) => bloc.getNotification(),
      expect: () => [const NotificationState(listNotification: [])],
    );

    blocTest<NotificationCubit, NotificationState>(
      'Test Read notification',
      setUp: () {
        when(mockReadNotificationUseCase.call(params: "id"))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => notificationCubit,
      act: (bloc) => bloc.readNotification("id"),
      expect: () => [],
    );

    blocTest<NotificationCubit, NotificationState>(
      'Test Read All notification',
      setUp: () {
        when(mockReadAllNotificationUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => notificationCubit,
      act: (bloc) => bloc.readAllNotification(),
      expect: () => [],
    );

    blocTest<NotificationCubit, NotificationState>(
      'Test Read All notification',
      setUp: () {
        when(mockDeleteNotificationFromIDUseCase.call(params: "id"))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => notificationCubit,
      act: (bloc) => bloc.deleteNotification("id"),
      expect: () => [],
    );
  });
}
