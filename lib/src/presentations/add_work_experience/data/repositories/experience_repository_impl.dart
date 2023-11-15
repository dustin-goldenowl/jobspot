import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_work_experience/data/models/update_work_experience_model.dart';
import 'package:jobspot/src/presentations/add_work_experience/data/models/add_work_experience_model.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/add_work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart';

@LazySingleton(as: ExperienceRepository)
class ExperienceRepositoryImpl extends ExperienceRepository {
  @override
  Future<DataState<bool>> addWorkExperience(
      AddWorkExperienceEntity experience) async {
    try {
      await XCollection.workExperience
          .doc()
          .set(AddWorkExperienceModel.fromEntity(experience).toJson());
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateWorkExperience(
      UpdateWorkExperienceEntity experience) async {
    try {
      await XCollection.workExperience
          .doc(experience.id)
          .update(UpdateWorkExperienceModel.fromEntity(experience).toJson());
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteWorkExperience(String id) async {
    try {
      await XCollection.workExperience.doc(id).delete();
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
