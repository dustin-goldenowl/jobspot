import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class StreamNotificationUseCase
    extends StreamUseCase<DataState<List<NotificationEntity>>, dynamic> {
  final NotificationRepository _repository;

  StreamNotificationUseCase(this._repository);

  @override
  Stream<DataState<List<NotificationEntity>>> call({params}) {
    return _repository.streamNotification();
  }
}
