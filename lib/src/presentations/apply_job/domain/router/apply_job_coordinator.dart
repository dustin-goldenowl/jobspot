import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/app_paths.dart';

class ApplyJobCoordinator {
  ApplyJobCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void backToHome() => rootRouter.popUntilRouteWithPath("/main");

  static void showTestIQ(String applyID) =>
      rootRouter.replace(TestIQRoute(applyID: applyID));

  static void showSearchJob() {
    bool isHaveSearch =
        rootRouter.stack.map((e) => e.name).toList().contains("SearchJobRoute");
    if (isHaveSearch) {
      rootRouter.popUntilRouteWithPath(AppPaths.searchJob);
    } else {
      rootRouter.popUntilRouteWithPath(AppPaths.main);
      rootRouter.push(SearchJobRoute());
    }
  }
}
