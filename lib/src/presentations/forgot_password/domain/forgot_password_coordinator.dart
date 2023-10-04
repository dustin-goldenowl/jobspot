import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class ForgotPasswordCoordinator {
  ForgotPasswordCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignIn() => rootRouter.pop();

  static void showCheckMail(String email) =>
      rootRouter.replace(CheckEmailRoute(email: email));
}
