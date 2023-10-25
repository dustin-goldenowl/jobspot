import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class ReadAllNotificationUseCase extends UseCase<DataState<bool>, dynamic> {
  final NotificationRepository _repository;

  ReadAllNotificationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({params}) {
    return _repository.readAllNotification();
  }
}
