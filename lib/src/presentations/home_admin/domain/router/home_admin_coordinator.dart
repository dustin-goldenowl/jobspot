import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class HomeAdminCoordinator {
  HomeAdminCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showSetting() => rootRouter.push(const SettingRoute());

  static void showViewCompany(String uid) =>
      rootRouter.push(ViewCompanyProfileRoute(uid: uid));
}
