import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';

abstract class ExperienceRepository {
  Future<DataState<bool>> addWorkExperience(WorkExperienceEntity experience);
}
