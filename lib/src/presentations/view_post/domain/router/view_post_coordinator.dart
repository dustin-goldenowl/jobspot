import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class ViewPostCoordinator {
  ViewPostCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showViewProfile({required String uid}) =>
      rootRouter.push(ViewApplicantProfileRoute(uid: uid));
}
