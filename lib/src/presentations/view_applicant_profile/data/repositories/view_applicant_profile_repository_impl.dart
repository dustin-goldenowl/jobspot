import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/education_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/appreciation_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/work_experience_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/data/models/user_model.dart' as user_model;
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/view_language/data/models/language_model.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';

@LazySingleton(as: ViewApplicantProfileRepository)
class ViewApplicantProfileRepositoryImpl
    extends ViewApplicantProfileRepository {
  @override
  Future<DataState<List<WorkExperienceEntity>>> getWorkExperience(
      String uid) async {
    try {
      final response =
          await XCollection.workExperience.where("owner", isEqualTo: uid).get();
      List<WorkExperienceModel> listExperience = response.docs
          .map((e) => WorkExperienceModel.fromDocumentSnapshot(e))
          .toList();
      return DataSuccess(
          listExperience.map((e) => e.toWorkExperienceEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<EducationEntity>>> getEducation(String uid) async {
    try {
      final response =
          await XCollection.education.where("owner", isEqualTo: uid).get();
      List<EducationModel> listExperience = response.docs
          .map((e) => EducationModel.fromDocumentSnapshot(e))
          .toList();
      return DataSuccess(
          listExperience.map((e) => e.toEducationEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<AppreciationEntity>>> getAppreciation(
      String uid) async {
    try {
      final response =
          await XCollection.appreciation.where("owner", isEqualTo: uid).get();
      List<AppreciationModel> listExperience = response.docs
          .map((e) => AppreciationModel.fromDocumentSnapshot(e))
          .toList();
      return DataSuccess(
          listExperience.map((e) => e.toAppreciationEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<ResumeEntity>>> getResume(String uid) async {
    try {
      final response =
          await XCollection.resume.where("owner", isEqualTo: uid).get();
      List<ResumeModel> listExperience = response.docs
          .map((e) => ResumeModel.fromDocumentSnapshot(e))
          .toList();
      return DataSuccess(
          listExperience.map((e) => e.toResumeEntity()).toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<UserEntity>> getUserInfo(String uid) async {
    try {
      final response = await XCollection.user.doc(uid).get();
      final user = user_model.UserModel.fromJsonFirebase(response.data()!);
      await PrefsUtils.saveUserInfo(user.toJson());
      return DataSuccess(user.toUserEntity());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<LanguageEntity>>> getLanguages(String uid) async {
    try {
      final response =
          await XCollection.language.where("owner", isEqualTo: uid).get();
      return DataSuccess(response.docs
          .map((e) => LanguageModel.fromDocumentSnapshot(e).toLanguageEntity())
          .toList());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
