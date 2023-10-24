import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart';

@lazySingleton
class ChangePasswordUseCase extends UseCase<DataState<bool>, String> {
  final UpdatePasswordRepository _repository;

  ChangePasswordUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.changePassword(params);
  }
}
