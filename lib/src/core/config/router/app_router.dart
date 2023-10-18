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
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'connection', page: ConnectionRoute.page),
            AutoRoute(path: 'notification', page: NotificationRoute.page),
            AutoRoute(path: 'saveJob', page: SaveJobRoute.page),
          ],
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
        CustomRoute(
          path: '/jobPosition',
          page: JobPositionRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: '/location',
          page: LocationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: '/jobDescription',
          page: JobDescriptionRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: '/viewJob',
          page: ViewJobRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: '/applyJob',
          page: ApplyJobRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: '/viewPost',
          page: ViewPostRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: '/applicantProfile',
          page: ApplicantProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          children: [
            AutoRoute(path: "about", page: AboutTab.page),
            AutoRoute(path: "post", page: PostTab.page)
          ],
        ),
        CustomRoute(
          path: '/addExperience',
          page: AddWorkExperienceRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: '/addEducation',
          page: AddEducationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
      ];
}
