import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnBoardingRoute.page),
        CustomRoute(
          path: '/signIn',
          page: SignInRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: '/signUp',
          page: SignUpRoute.page,
          transitionsBuilder: TransitionsBuilders.zoomIn,
        ),
        CustomRoute(
          path: '/forgotPassword',
          page: ForgotPasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/checkEmail',
          page: CheckEmailRoute.page,
          transitionsBuilder: TransitionsBuilders.zoomIn,
        ),
        CustomRoute(
          path: '/verifyEmail',
          page: VerifyEmailRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          path: '/verifySuccess',
          page: VerifySuccessRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/main',
          page: MainRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/addPost',
          page: AddPostRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: '/addJob',
          page: AddJobRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
      ];
}
