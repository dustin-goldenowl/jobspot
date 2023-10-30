import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class RegisterGoogleCoordinator {
  RegisterGoogleCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void back() => rootRouter.pop();

  static void showMain() => rootRouter.replace(const MainRoute());
}
