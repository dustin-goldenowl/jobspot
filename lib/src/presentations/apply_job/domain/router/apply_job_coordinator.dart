import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';

class ApplyJobCoordinator {
  ApplyJobCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void backToHome() => rootRouter.popUntilRouteWithPath("/main");
}
