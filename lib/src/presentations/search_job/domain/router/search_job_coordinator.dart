import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/filter/domain/entities/filter_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class SearchJobCoordinator {
  SearchJobCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showLocation(Function(int code) onBack) =>
      rootRouter.push(LocationRoute(onBack: onBack));

  static void showViewJob(String jobID) =>
      rootRouter.push(ViewJobRoute(jobID: jobID));

  static void showApplyJob(JobEntity job) =>
      rootRouter.push(ApplyJobRoute(job: job));

  static void showFilterJob({
    required Function(FilterEntity entity) onBack,
    FilterEntity? filter,
  }) =>
      rootRouter.push(FilterRoute(onBack: onBack, filter: filter));
}
