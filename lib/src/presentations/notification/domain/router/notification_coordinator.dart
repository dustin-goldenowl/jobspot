import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class NotificationCoordinator {
  NotificationCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showPost(String postID) =>
      rootRouter.push(ViewPostRoute(postID: postID));

  static void showJob(String jobID) =>
      rootRouter.push(ViewJobRoute(jobID: jobID));

  static void showViewProfile(String uid) =>
      rootRouter.push(ViewApplicantProfileRoute(uid: uid));
}
