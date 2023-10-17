import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/experience_repository.dart';

@lazySingleton
class AddExperienceUseCase
    extends UseCase<DataState<bool>, WorkExperienceEntity> {
  final ExperienceRepository _repository;

  AddExperienceUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required WorkExperienceEntity params}) {
    return _repository.addWorkExperience(params);
  }
}
