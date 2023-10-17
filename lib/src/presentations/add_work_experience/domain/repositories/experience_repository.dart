import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/add_work_experience_entity.dart';

abstract class ExperienceRepository {
  Future<DataState<bool>> addWorkExperience(AddWorkExperienceEntity experience);

  Future<DataState<bool>> updateWorkExperience(
      UpdateWorkExperienceEntity experience);

  Future<DataState<bool>> deleteWorkExperience(String id);
}
