import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class SignInCoordinator {
  static AppRouter get rootRouter => getIt<AppRouter>();

  //Todo After have Sign Up, will change later
  static void showSignUp() => rootRouter.replace(const OnBoardingRoute());
}
