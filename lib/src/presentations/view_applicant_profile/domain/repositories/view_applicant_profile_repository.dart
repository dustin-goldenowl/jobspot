import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';

abstract class ViewApplicantProfileRepository {
  Future<DataState<List<WorkExperienceEntity>>> getWorkExperience(String uid);

  Future<DataState<List<EducationEntity>>> getEducation(String uid);

  Future<DataState<List<AppreciationEntity>>> getAppreciation(String uid);

  Future<DataState<List<ResumeEntity>>> getResume(String uid);

  Future<DataState<UserEntity>> getUserInfo(String uid);

  Future<DataState<List<LanguageEntity>>> getLanguages(String uid);
}
