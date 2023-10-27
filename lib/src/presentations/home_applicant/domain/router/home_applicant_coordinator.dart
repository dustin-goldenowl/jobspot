import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class HomeApplicantCoordinator {
  HomeApplicantCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showViewJobDescription(String jobID) =>
      rootRouter.push(ViewJobRoute(jobID: jobID));

  static void showApplyJob({required JobEntity job}) =>
      rootRouter.push(ApplyJobRoute(job: job));

  static void showApplicantProfile() =>
      rootRouter.push(const ApplicantProfileRoute());

  static void showSearchJob() => rootRouter.push(const SearchJobRoute());
}
