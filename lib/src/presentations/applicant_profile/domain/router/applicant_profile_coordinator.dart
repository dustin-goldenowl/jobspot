import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/education_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/work_experience_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/education_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/appreciation_model.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';

class ApplicantProfileCoordinator {
  ApplicantProfileCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showFullPost({
    required PostEntity post,
    bool isComment = false,
  }) =>
      rootRouter.push(ViewPostRoute(post: post, isComment: isComment));

  static void showEditPost({required PostEntity post}) => rootRouter.push(
      AddPostRoute(post: PostModel.fromEntity(post).toUpdatePostEntity()));

  static void showAddAboutMe({
    required String title,
    required String description,
    required Function(String value) onBack,
  }) =>
      rootRouter.push(JobDescriptionRoute(
          title: title, description: description, onBack: onBack));

  static void showAddWorkExperience({WorkExperienceEntity? experience}) =>
      rootRouter.push(AddWorkExperienceRoute(
        experience: experience == null
            ? null
            : WorkExperienceModel.fromEntity(experience)
                .toUpdateWorkExperienceEntity(),
      ));

  static void showAddEducation({EducationEntity? education}) =>
      rootRouter.push(AddEducationRoute(
        education: education == null
            ? null
            : EducationModel.fromEntity(education).toUpdateEducationEntity(),
      ));

  static void showAddAppreciation({AppreciationEntity? appreciation}) =>
      rootRouter.push(AddAppreciationRoute(
        appreciation: appreciation != null
            ? AppreciationModel.fromEntity(appreciation)
                .toUpdateAppreciationEntity()
            : null,
      ));

  static void showAddResume() => rootRouter.push(const AddResumeRoute());

  static void viewPDF({required String url, String? title}) =>
      rootRouter.push(ViewPDFRoute(url: url, title: title));

  static void showAddSkill(List<SkillEntity> listSkill) =>
      rootRouter.push(AddSkillRoute(listSkill: listSkill));

  static void showViewLanguage() => rootRouter.push(const ViewLanguageRoute());
  static void showViewLanguage(List<LanguageEntity> languages) =>
      rootRouter.push(ViewLanguageRoute(languages: languages));
}
