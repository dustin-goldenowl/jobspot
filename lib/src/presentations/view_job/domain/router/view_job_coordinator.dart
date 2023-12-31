import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class ViewJobCoordinator {
  ViewJobCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showApplyJob({required JobEntity job}) =>
      rootRouter.push(ApplyJobRoute(job: job));

  static void showViewCompany(String uid) =>
      rootRouter.push(ViewCompanyProfileRoute(uid: uid));
}
