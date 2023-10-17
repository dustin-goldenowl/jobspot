import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/connection/data/models/post_model.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

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

  static void showAddWorkExperience() =>
      rootRouter.push(const AddWorkExperienceRoute());
}
