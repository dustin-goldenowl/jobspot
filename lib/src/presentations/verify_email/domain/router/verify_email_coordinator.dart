import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class VerifyEmailCoordinator {
  VerifyEmailCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignIn() => rootRouter.replace(const SignInRoute());

  static void showVerifySuccess() =>
      rootRouter.replace(const VerifySuccessRoute());
}
