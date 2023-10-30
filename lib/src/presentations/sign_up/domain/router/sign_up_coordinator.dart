import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class SignUpCoordinator {
  SignUpCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignIn() => rootRouter.replace(const SignInRoute());

  static void showVerifyEmail() => rootRouter.replace(const VerifyEmailRoute());

  static void showRegisterGoogle() =>
      rootRouter.push(const RegisterGoogleRoute());
}
