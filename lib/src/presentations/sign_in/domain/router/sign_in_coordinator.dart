import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';

class SignInCoordinator {
  SignInCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSignUp() => rootRouter.replace(const SignUpRoute());

  static void showVerifyEmail() => rootRouter.replace(const VerifyEmailRoute());

  static void showVerifyBusiness() =>
      rootRouter.replace(const VerifyBusinessRoute());

  static void showForgotPassword() =>
      rootRouter.push(const ForgotPasswordRoute());

  static void showMain() {
    if (PrefsUtils.getUserInfo()!.role == UserRole.admin) {
      rootRouter.replace(const HomeAdminRoute());
    } else {
      rootRouter.replace(const MainRoute());
    }
  }
}
