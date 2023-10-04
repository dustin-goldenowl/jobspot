import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class OnBoardingCoordinator {
  OnBoardingCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignIn() => rootRouter.replace(const SignInRoute());
}
