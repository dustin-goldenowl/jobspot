import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/add_work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart';

@lazySingleton
class AddExperienceUseCase
    extends UseCase<DataState<bool>, AddWorkExperienceEntity> {
  final ExperienceRepository _repository;

  AddExperienceUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required AddWorkExperienceEntity params}) {
    return _repository.addWorkExperience(params);
  }
}
