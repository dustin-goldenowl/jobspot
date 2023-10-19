import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

abstract class ApplicantProfileRepository {
  Stream<DataState<List<PostEntity>>> getListPost(int limit);

  Stream<DataState<List<WorkExperienceEntity>>> getWorkExperience();

  Stream<DataState<List<EducationEntity>>> getEducation();

  Stream<DataState<List<AppreciationEntity>>> getAppreciation();

  Stream<DataState<List<ResumeEntity>>> getResume();

  Future<DataState<bool>> deletePost(PostEntity post);
}
