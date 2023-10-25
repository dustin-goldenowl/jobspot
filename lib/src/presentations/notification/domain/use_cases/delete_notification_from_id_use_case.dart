import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/notification/domain/repositories/notification_repository.dart';

@lazySingleton
class DeleteNotificationFromIDUseCase extends UseCase<DataState<bool>, String> {
  final NotificationRepository _repository;

  DeleteNotificationFromIDUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteNotificationFromID(params);
  }
}
