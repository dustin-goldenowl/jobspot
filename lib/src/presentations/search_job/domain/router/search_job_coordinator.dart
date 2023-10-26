import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class SearchJobCoordinator {
  SearchJobCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showLocation(Function(int code) onBack) =>
      rootRouter.push(LocationRoute(onBack: onBack));

  static void showViewJob(String jobID) =>
      rootRouter.push(ViewJobRoute(jobID: jobID));
}
