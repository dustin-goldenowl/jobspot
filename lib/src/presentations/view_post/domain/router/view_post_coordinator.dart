import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/enum/user_role.dart';

class ViewPostCoordinator {
  ViewPostCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showViewProfile({required String uid, required UserRole role}) {
    if (role == UserRole.applicant) {
      rootRouter.push(ViewApplicantProfileRoute(uid: uid));
    } else {
      rootRouter.push(ViewCompanyProfileRoute(uid: uid));
    }
  }
}
