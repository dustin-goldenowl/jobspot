import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class ViewJobApplicantCoordinator {
  ViewJobApplicantCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void viewPDF(String path) => rootRouter.push(ViewPDFRoute(url: path));

  static void showApplicantProfile(String uid) =>
      rootRouter.push(ViewApplicantProfileRoute(uid: uid));
}
