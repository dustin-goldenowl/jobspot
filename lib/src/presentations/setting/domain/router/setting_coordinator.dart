import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class SettingCoordinator {
  SettingCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showUpdatePassword() =>
      rootRouter.push(const UpdatePasswordRoute());

  static void logOut() => rootRouter.pushAndPopUntil(
        const SignInRoute(),
        predicate: (route) => false,
      );
}
