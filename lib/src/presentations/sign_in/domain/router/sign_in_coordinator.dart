import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class SignInCoordinator {
  SignInCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignUp() => rootRouter.replace(const SignUpRoute());

  static void showForgotPassword() =>
      rootRouter.push(const ForgotPasswordRoute());

  static void showMain() => rootRouter.replace(const MainRoute());
}
