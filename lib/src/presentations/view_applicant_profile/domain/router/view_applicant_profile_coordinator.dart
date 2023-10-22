import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

class ViewApplicantProfileCoordinator {
  ViewApplicantProfileCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showFullPost({
    required PostEntity post,
    bool isComment = false,
  }) =>
      rootRouter.push(ViewPostRoute(post: post, isComment: isComment));

  static void viewPDF({required String url, String? title}) =>
      rootRouter.push(ViewPDFRoute(url: url, title: title));
}
