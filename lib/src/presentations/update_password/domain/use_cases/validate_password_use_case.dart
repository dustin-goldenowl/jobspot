import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/update_password/domain/repositories/update_password_repository.dart';

@lazySingleton
class ValidatePassworkUseCase extends UseCase<DataState<bool>, String> {
  UpdatePasswordRepository _repository;

  ValidatePassworkUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.validatePassword(params);
  }
}
