import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class AddJobCoordinator {
  AddJobCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showAddJobDescription({
    required dynamic Function(String description) onBack,
    required String description,
  }) =>
      rootRouter
          .push(JobDescriptionRoute(onBack: onBack, description: description));

  static void showJobLocation({required Function(int code) onBack}) =>
      rootRouter.push(LocationRoute(onBack: onBack));

  static void showJobPosition({required Function(String title) onBack}) =>
      rootRouter.push(JobPositionRoute(onBack: onBack));
}
