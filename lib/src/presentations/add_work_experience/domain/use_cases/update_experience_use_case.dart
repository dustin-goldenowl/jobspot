import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart';

@lazySingleton
class UpdateExperienceUseCase
    extends UseCase<DataState<bool>, UpdateWorkExperienceEntity> {
  final ExperienceRepository _repository;

  UpdateExperienceUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required UpdateWorkExperienceEntity params}) {
    return _repository.updateWorkExperience(params);
  }
}
