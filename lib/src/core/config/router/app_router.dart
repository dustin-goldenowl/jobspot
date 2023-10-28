import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/app_paths.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: AppPaths.onBoarding, page: OnBoardingRoute.page),
        CustomRoute(
          path: AppPaths.signIn,
          page: SignInRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.signUp,
          page: SignUpRoute.page,
          transitionsBuilder: TransitionsBuilders.zoomIn,
        ),
        CustomRoute(
          path: AppPaths.forgotPassword,
          page: ForgotPasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: AppPaths.checkEmail,
          page: CheckEmailRoute.page,
          transitionsBuilder: TransitionsBuilders.zoomIn,
        ),
        CustomRoute(
          path: AppPaths.verifyEmail,
          page: VerifyEmailRoute.page,
          transitionsBuilder: TransitionsBuilders.slideTop,
        ),
        CustomRoute(
          path: AppPaths.verifySuccess,
          page: VerifySuccessRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: AppPaths.main,
          page: MainRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          children: [
            AutoRoute(
                path: AppPaths.homeApplicantTab, page: HomeApplicantRoute.page),
            AutoRoute(
                path: AppPaths.homeCompanyTab, page: HomeCompanyRoute.page),
            AutoRoute(path: AppPaths.connectionTab, page: ConnectionRoute.page),
            AutoRoute(
                path: AppPaths.notificationTab, page: NotificationRoute.page),
            AutoRoute(path: AppPaths.saveJobTab, page: SaveJobRoute.page),
          ],
        ),
        CustomRoute(
          path: AppPaths.addPost,
          page: AddPostRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.addJob,
          page: AddJobRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.jobPosition,
          page: JobPositionRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.location,
          page: LocationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.jobDescription,
          page: JobDescriptionRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.viewJob,
          page: ViewJobRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.applyJob,
          page: ApplyJobRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.viewJob,
          page: ViewPostRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.applicantProfile,
          page: ApplicantProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          children: [
            AutoRoute(
              path: AppPaths.applicantAboutTab,
              page: ApplicantAboutTab.page,
            ),
            AutoRoute(
              path: AppPaths.applicantPostTab,
              page: ApplicantPostTab.page,
            )
          ],
        ),
        CustomRoute(
          path: AppPaths.addExperience,
          page: AddWorkExperienceRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.addEducation,
          page: AddEducationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.addAppreciation,
          page: AddAppreciationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.addResume,
          page: AddResumeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.viewPDF,
          page: ViewPDFRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.addSkill,
          page: AddSkillRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.addLanguage,
          page: AddLanguageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.viewLanguage,
          page: ViewLanguageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.searchLanguage,
          page: SearchLanguageRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
        ),
        CustomRoute(
          path: AppPaths.viewApplicantProfile,
          page: ViewApplicantProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          children: [
            AutoRoute(
              path: AppPaths.viewApplicantAboutTab,
              page: ViewApplicantAboutTab.page,
            ),
            AutoRoute(
              path: AppPaths.viewApplicantPostTab,
              page: ViewApplicantPostTab.page,
            )
          ],
        ),
        CustomRoute(
          path: AppPaths.setting,
          page: SettingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.updatePassword,
          page: UpdatePasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.editApplicantProfile,
          page: EditApplicantProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.viewCompanyProfile,
          page: ViewCompanyProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          children: [
            AutoRoute(
              path: AppPaths.viewCompanyAboutTab,
              page: ViewCompanyAboutTab.page,
            ),
            AutoRoute(
              path: AppPaths.viewCompanyPostTab,
              page: ViewCompanyPostTab.page,
            ),
            AutoRoute(
              path: AppPaths.viewCompanyJobTab,
              page: ViewCompanyJobTab.page,
            ),
          ],
        ),
        CustomRoute(
          path: AppPaths.searchJob,
          page: SearchJobRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.filterJob,
          page: FilterRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.viewJobApplicant,
          page: ViewJobApplicantRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          path: AppPaths.homeAdmin,
          page: HomeAdminRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
      ];
}
