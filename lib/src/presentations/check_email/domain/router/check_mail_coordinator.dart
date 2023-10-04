import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';

class CheckMailoordinator {
  CheckMailoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignIn() => rootRouter.pop();
}
