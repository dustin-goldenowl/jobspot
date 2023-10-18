import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart';

@lazySingleton
class DeleteExperienceUseCase extends UseCase<DataState<bool>, String> {
  final ExperienceRepository _repository;

  DeleteExperienceUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteWorkExperience(params);
  }
}
