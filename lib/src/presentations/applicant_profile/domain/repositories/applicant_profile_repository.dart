import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/get_post_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

abstract class ApplicantProfileRepository {
  Stream<DataState<List<PostEntity>>> getListPost(GetPostEntity entity);

  Stream<DataState<List<WorkExperienceEntity>>> getWorkExperience();

  Stream<DataState<List<EducationEntity>>> getEducation();

  Stream<DataState<List<AppreciationEntity>>> getAppreciation();

  Stream<DataState<List<ResumeEntity>>> getResume();

  Stream<DataState<UserEntity>> getUserInfo();

  Future<DataState<List<SkillEntity>>> getSkill(List<String> listSkill);

  Future<DataState<bool>> deletePost(PostEntity post);

  Future<DataState<bool>> updateAboutMe(String description);

  Future<List<UserModel>> getListUser(Set<String> listID);

  Future<List<PostModel>> getListSharePost(Set<String?> listPostID);
}
