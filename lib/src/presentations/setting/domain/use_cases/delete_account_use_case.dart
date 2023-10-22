import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/setting/domain/repositories/setting_repository.dart';

@lazySingleton
class DeleteAccountUseCase extends UseCase<DataState<bool>, dynamic> {
  final SettingRepository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<DataState<bool>> call({params}) {
    return _repository.deleteAccount();
  }
}
