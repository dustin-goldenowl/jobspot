import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/work_experience_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/repositories/experience_repository.dart';

@LazySingleton(as: ExperienceRepository)
class ExperienceRepositoryImpl extends ExperienceRepository {
  @override
  Future<DataState<bool>> addWorkExperience(
      WorkExperienceEntity experience) async {
    try {
      await FirebaseFirestore.instance
          .collection("workExperiences")
          .doc()
          .set(WorkExperienceModel.fromEntity(experience).toJson());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
