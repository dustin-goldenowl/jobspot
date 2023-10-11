import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';

class JobDescriptionCoordinator {
  JobDescriptionCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void closeScreen() async {
    await rootRouter.pop();
    await rootRouter.pop();
  }
}
