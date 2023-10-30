import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class FollowCoordinator {
  FollowCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showViewApplicantProfile({required String uid}) =>
      rootRouter.push(ViewApplicantProfileRoute(uid: uid));

  static void showViewCompanyProfile({required String uid}) =>
      rootRouter.push(ViewCompanyProfileRoute(uid: uid));
}
