import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/company_profile/domain/repositories/company_profile_repository.dart';

@lazySingleton
class DeleteJobUseCase extends UseCase<DataState<bool>, String> {
  final CompanyProfileRepository _repository;

  DeleteJobUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteJob(params);
  }
}
