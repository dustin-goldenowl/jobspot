import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';

class VerifySuccessCoordinator {
  VerifySuccessCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void backToSignIn() {
    PrefsUtils.removeUserInfo();
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    rootRouter.replace(const SignInRoute());
  }

  static void showVerifyCompany() =>
      rootRouter.replace(const VerifyBusinessRoute());
}
