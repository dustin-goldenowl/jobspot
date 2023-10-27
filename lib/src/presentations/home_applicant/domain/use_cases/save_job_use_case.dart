import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/repositories/home_applicant_repository.dart';

@lazySingleton
class SaveJobUseCase extends UseCase<DataState<bool>, String> {
  final HomeApplicantRepository _repository;

  SaveJobUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.saveJob(params);
  }
}
