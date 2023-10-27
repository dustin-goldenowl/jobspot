import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class HomeCompanyCoordinator {
  HomeCompanyCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showViewJobApplicant(String title, String jobID) =>
      rootRouter.push(ViewJobApplicantRoute(title: title, jobID: jobID));
}
