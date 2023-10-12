import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class HomeCoordinator {
  HomeCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showviewJobDescription(String postID) =>
      rootRouter.push(ViewJobRoute(postID: postID));
}
