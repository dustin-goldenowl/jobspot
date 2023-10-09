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
}
