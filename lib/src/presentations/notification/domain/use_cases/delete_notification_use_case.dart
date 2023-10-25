import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/entities/send_notification_entity.dart';
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class DeleteNotificationUseCase
    extends UseCase<DataState<bool>, SendNotificationEntity> {
  final NotificationRepository _repository;

  DeleteNotificationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required SendNotificationEntity params}) {
    return _repository.deleteNotification(params);
  }
}
