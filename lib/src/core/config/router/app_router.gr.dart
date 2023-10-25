// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i43;
import 'package:flutter/material.dart' as _i44;
import 'package:flutter/widgets.dart' as _i53;
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/update_appreciation_entity.dart'
    as _i45;
import 'package:jobspot/src/presentations/add_appreciation/screen/add_appreciation_page.dart'
    as _i1;
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart'
    as _i46;
import 'package:jobspot/src/presentations/add_education/screen/add_education_page.dart'
    as _i2;
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart'
    as _i47;
import 'package:jobspot/src/presentations/add_job/screen/add_job_page.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_language/domain/entities/update_language_entity.dart'
    as _i48;
import 'package:jobspot/src/presentations/add_language/screen/add_language_page.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart'
    as _i49;
import 'package:jobspot/src/presentations/add_post/screen/add_post_page.dart'
    as _i5;
import 'package:jobspot/src/presentations/add_resume/screen/add_resume_page.dart'
    as _i6;
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart'
    as _i50;
import 'package:jobspot/src/presentations/add_skill/screen/add_skill_page.dart'
    as _i7;
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart'
    as _i51;
import 'package:jobspot/src/presentations/add_work_experience/screen/add_work_experience_page.dart'
    as _i8;
import 'package:jobspot/src/presentations/applicant_profile/screen/applicant_profile_page.dart'
    as _i11;
import 'package:jobspot/src/presentations/applicant_profile/widgets/applicant_about_tab.dart'
    as _i9;
import 'package:jobspot/src/presentations/applicant_profile/widgets/applicant_post_tab.dart'
    as _i10;
import 'package:jobspot/src/presentations/apply_job/screen/apply_job_page.dart'
    as _i12;
import 'package:jobspot/src/presentations/check_email/screen/check_email_page.dart'
    as _i13;
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart'
    as _i56;
import 'package:jobspot/src/presentations/connection/screen/connection_page.dart'
    as _i14;
import 'package:jobspot/src/presentations/edit_applicant_profile/screen/edit_applicant_profile_page.dart'
    as _i15;
import 'package:jobspot/src/presentations/forgot_password/screen/forgot_password_page.dart'
    as _i16;
import 'package:jobspot/src/presentations/home/screen/home_page.dart' as _i17;
import 'package:jobspot/src/presentations/job_description/screen/job_description_page.dart'
    as _i18;
import 'package:jobspot/src/presentations/job_position/screen/job_position_page.dart'
    as _i19;
import 'package:jobspot/src/presentations/location/screen/location_page.dart'
    as _i20;
import 'package:jobspot/src/presentations/main/screen/main_page.dart' as _i21;
import 'package:jobspot/src/presentations/notification/screen/notification_page.dart'
    as _i22;
import 'package:jobspot/src/presentations/on_boarding/screen/on_boarding_page.dart'
    as _i23;
import 'package:jobspot/src/presentations/save_job/screen/save_job_page.dart'
    as _i24;
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart'
    as _i54;
import 'package:jobspot/src/presentations/search_language/screen/search_language_page.dart'
    as _i25;
import 'package:jobspot/src/presentations/setting/screen/setting_page.dart'
    as _i26;
import 'package:jobspot/src/presentations/sign_in/screen/sign_in_page.dart'
    as _i27;
import 'package:jobspot/src/presentations/sign_up/screen/sign_up_page.dart'
    as _i28;
import 'package:jobspot/src/presentations/update_password/screen/update_password_page.dart'
    as _i29;
import 'package:jobspot/src/presentations/verify_email/screen/verify_email_page.dart'
    as _i30;
import 'package:jobspot/src/presentations/verify_success/screen/verify_success_page.dart'
    as _i31;
import 'package:jobspot/src/presentations/view_applicant_profile/screen/view_applicant_profile_page.dart'
    as _i34;
import 'package:jobspot/src/presentations/view_applicant_profile/widgets/view_applicant_about_tab.dart'
    as _i32;
import 'package:jobspot/src/presentations/view_applicant_profile/widgets/view_applicant_post_tab.dart'
    as _i33;
import 'package:jobspot/src/presentations/view_company_profile/screen/view_company_profile_page.dart'
    as _i38;
import 'package:jobspot/src/presentations/view_company_profile/widgets/view_company_about_tab.dart'
    as _i35;
import 'package:jobspot/src/presentations/view_company_profile/widgets/view_company_job_tab.dart'
    as _i36;
import 'package:jobspot/src/presentations/view_company_profile/widgets/view_company_post_tab.dart'
    as _i37;
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart'
    as _i52;
import 'package:jobspot/src/presentations/view_job/screen/view_job_page.dart'
    as _i39;
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart'
    as _i55;
import 'package:jobspot/src/presentations/view_language/screen/view_language_page.dart'
    as _i40;
import 'package:jobspot/src/presentations/view_pdf/screen/view_pdf_page.dart'
    as _i41;
import 'package:jobspot/src/presentations/view_post/screen/view_post_page.dart'
    as _i42;

abstract class $AppRouter extends _i43.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i43.PageFactory> pagesMap = {
    AddAppreciationRoute.name: (routeData) {
      final args = routeData.argsAs<AddAppreciationRouteArgs>(
          orElse: () => const AddAppreciationRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddAppreciationPage(
          key: args.key,
          appreciation: args.appreciation,
        ),
      );
    },
    AddEducationRoute.name: (routeData) {
      final args = routeData.argsAs<AddEducationRouteArgs>(
          orElse: () => const AddEducationRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddEducationPage(
          key: args.key,
          education: args.education,
        ),
      );
    },
    AddJobRoute.name: (routeData) {
      final args = routeData.argsAs<AddJobRouteArgs>(
          orElse: () => const AddJobRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddJobPage(
          key: args.key,
          job: args.job,
        ),
      );
    },
    AddLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<AddLanguageRouteArgs>(
          orElse: () => const AddLanguageRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AddLanguagePage(
          key: args.key,
          language: args.language,
        ),
      );
    },
    AddPostRoute.name: (routeData) {
      final args = routeData.argsAs<AddPostRouteArgs>(
          orElse: () => const AddPostRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AddPostPage(
          key: args.key,
          post: args.post,
        ),
      );
    },
    AddResumeRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AddResumePage(),
      );
    },
    AddSkillRoute.name: (routeData) {
      final args = routeData.argsAs<AddSkillRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.AddSkillPage(
          key: args.key,
          listSkill: args.listSkill,
        ),
      );
    },
    AddWorkExperienceRoute.name: (routeData) {
      final args = routeData.argsAs<AddWorkExperienceRouteArgs>(
          orElse: () => const AddWorkExperienceRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.AddWorkExperiencePage(
          key: args.key,
          experience: args.experience,
        ),
      );
    },
    ApplicantAboutTab.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ApplicantAboutTab(),
      );
    },
    ApplicantPostTab.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ApplicantPostTab(),
      );
    },
    ApplicantProfileRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ApplicantProfilePage(),
      );
    },
    ApplyJobRoute.name: (routeData) {
      final args = routeData.argsAs<ApplyJobRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ApplyJobPage(
          key: args.key,
          job: args.job,
        ),
      );
    },
    CheckEmailRoute.name: (routeData) {
      final args = routeData.argsAs<CheckEmailRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.CheckEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ConnectionRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ConnectionPage(),
      );
    },
    EditApplicantProfileRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.EditApplicantProfilePage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.HomePage(),
      );
    },
    JobDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<JobDescriptionRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.JobDescriptionPage(
          key: args.key,
          title: args.title,
          description: args.description,
          onBack: args.onBack,
        ),
      );
    },
    JobPositionRoute.name: (routeData) {
      final args = routeData.argsAs<JobPositionRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.JobPositionPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.LocationPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.MainPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.NotificationPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.OnBoardingPage(),
      );
    },
    SaveJobRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SaveJobPage(),
      );
    },
    SearchLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<SearchLanguageRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.SearchLanguagePage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    SettingRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SettingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SignUpPage(),
      );
    },
    UpdatePasswordRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.UpdatePasswordPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.VerifyEmailPage(),
      );
    },
    VerifySuccessRoute.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.VerifySuccessPage(),
      );
    },
    ViewApplicantAboutTab.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.ViewApplicantAboutTab(),
      );
    },
    ViewApplicantPostTab.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.ViewApplicantPostTab(),
      );
    },
    ViewApplicantProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ViewApplicantProfileRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.ViewApplicantProfilePage(
          key: args.key,
          uid: args.uid,
        ),
      );
    },
    ViewCompanyAboutTab.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.ViewCompanyAboutTab(),
      );
    },
    ViewCompanyJobTab.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.ViewCompanyJobTab(),
      );
    },
    ViewCompanyPostTab.name: (routeData) {
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.ViewCompanyPostTab(),
      );
    },
    ViewCompanyProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ViewCompanyProfileRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.ViewCompanyProfilePage(
          key: args.key,
          uid: args.uid,
        ),
      );
    },
    ViewJobRoute.name: (routeData) {
      final args = routeData.argsAs<ViewJobRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.ViewJobPage(
          key: args.key,
          jobID: args.jobID,
        ),
      );
    },
    ViewLanguageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewLanguageRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.ViewLanguagePage(
          key: args.key,
          languages: args.languages,
        ),
      );
    },
    ViewPDFRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPDFRouteArgs>();
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i41.ViewPDFPage(
          key: args.key,
          title: args.title,
          url: args.url,
        ),
      );
    },
    ViewPostRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPostRouteArgs>(
          orElse: () => const ViewPostRouteArgs());
      return _i43.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i42.ViewPostPage(
          key: args.key,
          post: args.post,
          postID: args.postID,
          isComment: args.isComment,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddAppreciationPage]
class AddAppreciationRoute
    extends _i43.PageRouteInfo<AddAppreciationRouteArgs> {
  AddAppreciationRoute({
    _i44.Key? key,
    _i45.UpdateAppreciationEntity? appreciation,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          AddAppreciationRoute.name,
          args: AddAppreciationRouteArgs(
            key: key,
            appreciation: appreciation,
          ),
          initialChildren: children,
        );

  static const String name = 'AddAppreciationRoute';

  static const _i43.PageInfo<AddAppreciationRouteArgs> page =
      _i43.PageInfo<AddAppreciationRouteArgs>(name);
}

class AddAppreciationRouteArgs {
  const AddAppreciationRouteArgs({
    this.key,
    this.appreciation,
  });

  final _i44.Key? key;

  final _i45.UpdateAppreciationEntity? appreciation;

  @override
  String toString() {
    return 'AddAppreciationRouteArgs{key: $key, appreciation: $appreciation}';
  }
}

/// generated route for
/// [_i2.AddEducationPage]
class AddEducationRoute extends _i43.PageRouteInfo<AddEducationRouteArgs> {
  AddEducationRoute({
    _i44.Key? key,
    _i46.UpdateEducationEntity? education,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          AddEducationRoute.name,
          args: AddEducationRouteArgs(
            key: key,
            education: education,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEducationRoute';

  static const _i43.PageInfo<AddEducationRouteArgs> page =
      _i43.PageInfo<AddEducationRouteArgs>(name);
}

class AddEducationRouteArgs {
  const AddEducationRouteArgs({
    this.key,
    this.education,
  });

  final _i44.Key? key;

  final _i46.UpdateEducationEntity? education;

  @override
  String toString() {
    return 'AddEducationRouteArgs{key: $key, education: $education}';
  }
}

/// generated route for
/// [_i3.AddJobPage]
class AddJobRoute extends _i43.PageRouteInfo<AddJobRouteArgs> {
  AddJobRoute({
    _i44.Key? key,
    _i47.UpdateJobEntity? job,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          AddJobRoute.name,
          args: AddJobRouteArgs(
            key: key,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'AddJobRoute';

  static const _i43.PageInfo<AddJobRouteArgs> page =
      _i43.PageInfo<AddJobRouteArgs>(name);
}

class AddJobRouteArgs {
  const AddJobRouteArgs({
    this.key,
    this.job,
  });

  final _i44.Key? key;

  final _i47.UpdateJobEntity? job;

  @override
  String toString() {
    return 'AddJobRouteArgs{key: $key, job: $job}';
  }
}

/// generated route for
/// [_i4.AddLanguagePage]
class AddLanguageRoute extends _i43.PageRouteInfo<AddLanguageRouteArgs> {
  AddLanguageRoute({
    _i44.Key? key,
    _i48.UpdateLanguageEntity? language,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          AddLanguageRoute.name,
          args: AddLanguageRouteArgs(
            key: key,
            language: language,
          ),
          initialChildren: children,
        );

  static const String name = 'AddLanguageRoute';

  static const _i43.PageInfo<AddLanguageRouteArgs> page =
      _i43.PageInfo<AddLanguageRouteArgs>(name);
}

class AddLanguageRouteArgs {
  const AddLanguageRouteArgs({
    this.key,
    this.language,
  });

  final _i44.Key? key;

  final _i48.UpdateLanguageEntity? language;

  @override
  String toString() {
    return 'AddLanguageRouteArgs{key: $key, language: $language}';
  }
}

/// generated route for
/// [_i5.AddPostPage]
class AddPostRoute extends _i43.PageRouteInfo<AddPostRouteArgs> {
  AddPostRoute({
    _i44.Key? key,
    _i49.UpdatePostEntity? post,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          AddPostRoute.name,
          args: AddPostRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i43.PageInfo<AddPostRouteArgs> page =
      _i43.PageInfo<AddPostRouteArgs>(name);
}

class AddPostRouteArgs {
  const AddPostRouteArgs({
    this.key,
    this.post,
  });

  final _i44.Key? key;

  final _i49.UpdatePostEntity? post;

  @override
  String toString() {
    return 'AddPostRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i6.AddResumePage]
class AddResumeRoute extends _i43.PageRouteInfo<void> {
  const AddResumeRoute({List<_i43.PageRouteInfo>? children})
      : super(
          AddResumeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddResumeRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AddSkillPage]
class AddSkillRoute extends _i43.PageRouteInfo<AddSkillRouteArgs> {
  AddSkillRoute({
    _i44.Key? key,
    required List<_i50.SkillEntity> listSkill,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          AddSkillRoute.name,
          args: AddSkillRouteArgs(
            key: key,
            listSkill: listSkill,
          ),
          initialChildren: children,
        );

  static const String name = 'AddSkillRoute';

  static const _i43.PageInfo<AddSkillRouteArgs> page =
      _i43.PageInfo<AddSkillRouteArgs>(name);
}

class AddSkillRouteArgs {
  const AddSkillRouteArgs({
    this.key,
    required this.listSkill,
  });

  final _i44.Key? key;

  final List<_i50.SkillEntity> listSkill;

  @override
  String toString() {
    return 'AddSkillRouteArgs{key: $key, listSkill: $listSkill}';
  }
}

/// generated route for
/// [_i8.AddWorkExperiencePage]
class AddWorkExperienceRoute
    extends _i43.PageRouteInfo<AddWorkExperienceRouteArgs> {
  AddWorkExperienceRoute({
    _i44.Key? key,
    _i51.UpdateWorkExperienceEntity? experience,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          AddWorkExperienceRoute.name,
          args: AddWorkExperienceRouteArgs(
            key: key,
            experience: experience,
          ),
          initialChildren: children,
        );

  static const String name = 'AddWorkExperienceRoute';

  static const _i43.PageInfo<AddWorkExperienceRouteArgs> page =
      _i43.PageInfo<AddWorkExperienceRouteArgs>(name);
}

class AddWorkExperienceRouteArgs {
  const AddWorkExperienceRouteArgs({
    this.key,
    this.experience,
  });

  final _i44.Key? key;

  final _i51.UpdateWorkExperienceEntity? experience;

  @override
  String toString() {
    return 'AddWorkExperienceRouteArgs{key: $key, experience: $experience}';
  }
}

/// generated route for
/// [_i9.ApplicantAboutTab]
class ApplicantAboutTab extends _i43.PageRouteInfo<void> {
  const ApplicantAboutTab({List<_i43.PageRouteInfo>? children})
      : super(
          ApplicantAboutTab.name,
          initialChildren: children,
        );

  static const String name = 'ApplicantAboutTab';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ApplicantPostTab]
class ApplicantPostTab extends _i43.PageRouteInfo<void> {
  const ApplicantPostTab({List<_i43.PageRouteInfo>? children})
      : super(
          ApplicantPostTab.name,
          initialChildren: children,
        );

  static const String name = 'ApplicantPostTab';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ApplicantProfilePage]
class ApplicantProfileRoute extends _i43.PageRouteInfo<void> {
  const ApplicantProfileRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ApplicantProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicantProfileRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ApplyJobPage]
class ApplyJobRoute extends _i43.PageRouteInfo<ApplyJobRouteArgs> {
  ApplyJobRoute({
    _i44.Key? key,
    required _i52.JobEntity job,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ApplyJobRoute.name,
          args: ApplyJobRouteArgs(
            key: key,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'ApplyJobRoute';

  static const _i43.PageInfo<ApplyJobRouteArgs> page =
      _i43.PageInfo<ApplyJobRouteArgs>(name);
}

class ApplyJobRouteArgs {
  const ApplyJobRouteArgs({
    this.key,
    required this.job,
  });

  final _i44.Key? key;

  final _i52.JobEntity job;

  @override
  String toString() {
    return 'ApplyJobRouteArgs{key: $key, job: $job}';
  }
}

/// generated route for
/// [_i13.CheckEmailPage]
class CheckEmailRoute extends _i43.PageRouteInfo<CheckEmailRouteArgs> {
  CheckEmailRoute({
    _i44.Key? key,
    required String email,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          CheckEmailRoute.name,
          args: CheckEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckEmailRoute';

  static const _i43.PageInfo<CheckEmailRouteArgs> page =
      _i43.PageInfo<CheckEmailRouteArgs>(name);
}

class CheckEmailRouteArgs {
  const CheckEmailRouteArgs({
    this.key,
    required this.email,
  });

  final _i44.Key? key;

  final String email;

  @override
  String toString() {
    return 'CheckEmailRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i14.ConnectionPage]
class ConnectionRoute extends _i43.PageRouteInfo<void> {
  const ConnectionRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ConnectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectionRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i15.EditApplicantProfilePage]
class EditApplicantProfileRoute extends _i43.PageRouteInfo<void> {
  const EditApplicantProfileRoute({List<_i43.PageRouteInfo>? children})
      : super(
          EditApplicantProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditApplicantProfileRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ForgotPasswordPage]
class ForgotPasswordRoute extends _i43.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i43.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i17.HomePage]
class HomeRoute extends _i43.PageRouteInfo<void> {
  const HomeRoute({List<_i43.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i18.JobDescriptionPage]
class JobDescriptionRoute extends _i43.PageRouteInfo<JobDescriptionRouteArgs> {
  JobDescriptionRoute({
    _i44.Key? key,
    required String title,
    required String description,
    required dynamic Function(String) onBack,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          JobDescriptionRoute.name,
          args: JobDescriptionRouteArgs(
            key: key,
            title: title,
            description: description,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDescriptionRoute';

  static const _i43.PageInfo<JobDescriptionRouteArgs> page =
      _i43.PageInfo<JobDescriptionRouteArgs>(name);
}

class JobDescriptionRouteArgs {
  const JobDescriptionRouteArgs({
    this.key,
    required this.title,
    required this.description,
    required this.onBack,
  });

  final _i44.Key? key;

  final String title;

  final String description;

  final dynamic Function(String) onBack;

  @override
  String toString() {
    return 'JobDescriptionRouteArgs{key: $key, title: $title, description: $description, onBack: $onBack}';
  }
}

/// generated route for
/// [_i19.JobPositionPage]
class JobPositionRoute extends _i43.PageRouteInfo<JobPositionRouteArgs> {
  JobPositionRoute({
    _i44.Key? key,
    required dynamic Function(String) onBack,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          JobPositionRoute.name,
          args: JobPositionRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPositionRoute';

  static const _i43.PageInfo<JobPositionRouteArgs> page =
      _i43.PageInfo<JobPositionRouteArgs>(name);
}

class JobPositionRouteArgs {
  const JobPositionRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i44.Key? key;

  final dynamic Function(String) onBack;

  @override
  String toString() {
    return 'JobPositionRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i20.LocationPage]
class LocationRoute extends _i43.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i44.Key? key,
    required dynamic Function(int) onBack,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i43.PageInfo<LocationRouteArgs> page =
      _i43.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i44.Key? key;

  final dynamic Function(int) onBack;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i21.MainPage]
class MainRoute extends _i43.PageRouteInfo<void> {
  const MainRoute({List<_i43.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i22.NotificationPage]
class NotificationRoute extends _i43.PageRouteInfo<void> {
  const NotificationRoute({List<_i43.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i23.OnBoardingPage]
class OnBoardingRoute extends _i43.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i43.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SaveJobPage]
class SaveJobRoute extends _i43.PageRouteInfo<void> {
  const SaveJobRoute({List<_i43.PageRouteInfo>? children})
      : super(
          SaveJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaveJobRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i25.SearchLanguagePage]
class SearchLanguageRoute extends _i43.PageRouteInfo<SearchLanguageRouteArgs> {
  SearchLanguageRoute({
    _i53.Key? key,
    required dynamic Function(_i54.CountryEntity) onBack,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          SearchLanguageRoute.name,
          args: SearchLanguageRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchLanguageRoute';

  static const _i43.PageInfo<SearchLanguageRouteArgs> page =
      _i43.PageInfo<SearchLanguageRouteArgs>(name);
}

class SearchLanguageRouteArgs {
  const SearchLanguageRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i53.Key? key;

  final dynamic Function(_i54.CountryEntity) onBack;

  @override
  String toString() {
    return 'SearchLanguageRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i26.SettingPage]
class SettingRoute extends _i43.PageRouteInfo<void> {
  const SettingRoute({List<_i43.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i27.SignInPage]
class SignInRoute extends _i43.PageRouteInfo<void> {
  const SignInRoute({List<_i43.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SignUpPage]
class SignUpRoute extends _i43.PageRouteInfo<void> {
  const SignUpRoute({List<_i43.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i29.UpdatePasswordPage]
class UpdatePasswordRoute extends _i43.PageRouteInfo<void> {
  const UpdatePasswordRoute({List<_i43.PageRouteInfo>? children})
      : super(
          UpdatePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdatePasswordRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i30.VerifyEmailPage]
class VerifyEmailRoute extends _i43.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i43.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i31.VerifySuccessPage]
class VerifySuccessRoute extends _i43.PageRouteInfo<void> {
  const VerifySuccessRoute({List<_i43.PageRouteInfo>? children})
      : super(
          VerifySuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifySuccessRoute';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i32.ViewApplicantAboutTab]
class ViewApplicantAboutTab extends _i43.PageRouteInfo<void> {
  const ViewApplicantAboutTab({List<_i43.PageRouteInfo>? children})
      : super(
          ViewApplicantAboutTab.name,
          initialChildren: children,
        );

  static const String name = 'ViewApplicantAboutTab';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i33.ViewApplicantPostTab]
class ViewApplicantPostTab extends _i43.PageRouteInfo<void> {
  const ViewApplicantPostTab({List<_i43.PageRouteInfo>? children})
      : super(
          ViewApplicantPostTab.name,
          initialChildren: children,
        );

  static const String name = 'ViewApplicantPostTab';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i34.ViewApplicantProfilePage]
class ViewApplicantProfileRoute
    extends _i43.PageRouteInfo<ViewApplicantProfileRouteArgs> {
  ViewApplicantProfileRoute({
    _i44.Key? key,
    required String uid,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ViewApplicantProfileRoute.name,
          args: ViewApplicantProfileRouteArgs(
            key: key,
            uid: uid,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewApplicantProfileRoute';

  static const _i43.PageInfo<ViewApplicantProfileRouteArgs> page =
      _i43.PageInfo<ViewApplicantProfileRouteArgs>(name);
}

class ViewApplicantProfileRouteArgs {
  const ViewApplicantProfileRouteArgs({
    this.key,
    required this.uid,
  });

  final _i44.Key? key;

  final String uid;

  @override
  String toString() {
    return 'ViewApplicantProfileRouteArgs{key: $key, uid: $uid}';
  }
}

/// generated route for
/// [_i35.ViewCompanyAboutTab]
class ViewCompanyAboutTab extends _i43.PageRouteInfo<void> {
  const ViewCompanyAboutTab({List<_i43.PageRouteInfo>? children})
      : super(
          ViewCompanyAboutTab.name,
          initialChildren: children,
        );

  static const String name = 'ViewCompanyAboutTab';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i36.ViewCompanyJobTab]
class ViewCompanyJobTab extends _i43.PageRouteInfo<void> {
  const ViewCompanyJobTab({List<_i43.PageRouteInfo>? children})
      : super(
          ViewCompanyJobTab.name,
          initialChildren: children,
        );

  static const String name = 'ViewCompanyJobTab';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i37.ViewCompanyPostTab]
class ViewCompanyPostTab extends _i43.PageRouteInfo<void> {
  const ViewCompanyPostTab({List<_i43.PageRouteInfo>? children})
      : super(
          ViewCompanyPostTab.name,
          initialChildren: children,
        );

  static const String name = 'ViewCompanyPostTab';

  static const _i43.PageInfo<void> page = _i43.PageInfo<void>(name);
}

/// generated route for
/// [_i38.ViewCompanyProfilePage]
class ViewCompanyProfileRoute
    extends _i43.PageRouteInfo<ViewCompanyProfileRouteArgs> {
  ViewCompanyProfileRoute({
    _i44.Key? key,
    required String uid,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ViewCompanyProfileRoute.name,
          args: ViewCompanyProfileRouteArgs(
            key: key,
            uid: uid,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewCompanyProfileRoute';

  static const _i43.PageInfo<ViewCompanyProfileRouteArgs> page =
      _i43.PageInfo<ViewCompanyProfileRouteArgs>(name);
}

class ViewCompanyProfileRouteArgs {
  const ViewCompanyProfileRouteArgs({
    this.key,
    required this.uid,
  });

  final _i44.Key? key;

  final String uid;

  @override
  String toString() {
    return 'ViewCompanyProfileRouteArgs{key: $key, uid: $uid}';
  }
}

/// generated route for
/// [_i39.ViewJobPage]
class ViewJobRoute extends _i43.PageRouteInfo<ViewJobRouteArgs> {
  ViewJobRoute({
    _i44.Key? key,
    required String jobID,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ViewJobRoute.name,
          args: ViewJobRouteArgs(
            key: key,
            jobID: jobID,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewJobRoute';

  static const _i43.PageInfo<ViewJobRouteArgs> page =
      _i43.PageInfo<ViewJobRouteArgs>(name);
}

class ViewJobRouteArgs {
  const ViewJobRouteArgs({
    this.key,
    required this.jobID,
  });

  final _i44.Key? key;

  final String jobID;

  @override
  String toString() {
    return 'ViewJobRouteArgs{key: $key, jobID: $jobID}';
  }
}

/// generated route for
/// [_i40.ViewLanguagePage]
class ViewLanguageRoute extends _i43.PageRouteInfo<ViewLanguageRouteArgs> {
  ViewLanguageRoute({
    _i44.Key? key,
    required List<_i55.LanguageEntity> languages,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ViewLanguageRoute.name,
          args: ViewLanguageRouteArgs(
            key: key,
            languages: languages,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewLanguageRoute';

  static const _i43.PageInfo<ViewLanguageRouteArgs> page =
      _i43.PageInfo<ViewLanguageRouteArgs>(name);
}

class ViewLanguageRouteArgs {
  const ViewLanguageRouteArgs({
    this.key,
    required this.languages,
  });

  final _i44.Key? key;

  final List<_i55.LanguageEntity> languages;

  @override
  String toString() {
    return 'ViewLanguageRouteArgs{key: $key, languages: $languages}';
  }
}

/// generated route for
/// [_i41.ViewPDFPage]
class ViewPDFRoute extends _i43.PageRouteInfo<ViewPDFRouteArgs> {
  ViewPDFRoute({
    _i44.Key? key,
    String? title,
    required String url,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ViewPDFRoute.name,
          args: ViewPDFRouteArgs(
            key: key,
            title: title,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPDFRoute';

  static const _i43.PageInfo<ViewPDFRouteArgs> page =
      _i43.PageInfo<ViewPDFRouteArgs>(name);
}

class ViewPDFRouteArgs {
  const ViewPDFRouteArgs({
    this.key,
    this.title,
    required this.url,
  });

  final _i44.Key? key;

  final String? title;

  final String url;

  @override
  String toString() {
    return 'ViewPDFRouteArgs{key: $key, title: $title, url: $url}';
  }
}

/// generated route for
/// [_i42.ViewPostPage]
class ViewPostRoute extends _i43.PageRouteInfo<ViewPostRouteArgs> {
  ViewPostRoute({
    _i44.Key? key,
    _i56.PostEntity? post,
    String? postID,
    bool isComment = false,
    List<_i43.PageRouteInfo>? children,
  }) : super(
          ViewPostRoute.name,
          args: ViewPostRouteArgs(
            key: key,
            post: post,
            postID: postID,
            isComment: isComment,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPostRoute';

  static const _i43.PageInfo<ViewPostRouteArgs> page =
      _i43.PageInfo<ViewPostRouteArgs>(name);
}

class ViewPostRouteArgs {
  const ViewPostRouteArgs({
    this.key,
    this.post,
    this.postID,
    this.isComment = false,
  });

  final _i44.Key? key;

  final _i56.PostEntity? post;

  final String? postID;

  final bool isComment;

  @override
  String toString() {
    return 'ViewPostRouteArgs{key: $key, post: $post, postID: $postID, isComment: $isComment}';
  }
}
