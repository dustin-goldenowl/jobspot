import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart';

class ConnectionCoordinator {
  ConnectionCoordinator._();

  static AppRouter get rootRouter => getIt<AppRouter>();

  static void showFullPost({required PostEntity post}) =>
      rootRouter.push(ViewPostRoute(post: post));
}
