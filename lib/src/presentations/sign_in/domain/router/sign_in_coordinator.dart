import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class SignInCoordinator {
  SignInCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignUp() => rootRouter.replace(const SignUpRoute());

  static void showVerifyEmail() => rootRouter.replace(const VerifyEmailRoute());

  static void showVerifyBusiness() =>
      rootRouter.replace(const VerifyBusinessRoute());

  static void showForgotPassword() =>
      rootRouter.push(const ForgotPasswordRoute());

  static void showHomeAdmin() => rootRouter.replace(const HomeAdminRoute());

  static void showMain() => rootRouter.replace(const MainRoute());

  static void showRegisterGoogle() =>
      rootRouter.push(const RegisterGoogleRoute());
}
