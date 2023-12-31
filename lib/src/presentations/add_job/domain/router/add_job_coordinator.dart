import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class AddJobCoordinator {
  AddJobCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showAddJobDescription({
    required String description,
    required String title,
    required dynamic Function(String description) onBack,
  }) =>
      rootRouter.push(JobDescriptionRoute(
        title: title,
        description: description,
        onBack: onBack,
      ));

  static void showJobLocation({required Function(int code) onBack}) =>
      rootRouter.push(LocationRoute(onBack: onBack));

  static void showJobPosition({required Function(String title) onBack}) =>
      rootRouter.push(JobPositionRoute(onBack: onBack));
}
