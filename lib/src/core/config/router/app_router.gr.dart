// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart'
    as _i28;
import 'package:jobspot/src/presentations/add_education/screen/add_education_page.dart'
    as _i2;
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart'
    as _i29;
import 'package:jobspot/src/presentations/add_job/screen/add_job_page.dart'
    as _i3;
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart'
    as _i30;
import 'package:jobspot/src/presentations/add_post/screen/add_post_page.dart'
    as _i4;
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart'
    as _i31;
import 'package:jobspot/src/presentations/add_work_experience/screen/add_work_experience_page.dart'
    as _i5;
import 'package:jobspot/src/presentations/applicant_profile/screen/applicant_profile_page.dart'
    as _i6;
import 'package:jobspot/src/presentations/applicant_profile/widgets/about_tab.dart'
    as _i1;
import 'package:jobspot/src/presentations/applicant_profile/widgets/post_tab.dart'
    as _i18;
import 'package:jobspot/src/presentations/apply_job/screen/apply_job_page.dart'
    as _i7;
import 'package:jobspot/src/presentations/check_email/screen/check_email_page.dart'
    as _i8;
import 'package:jobspot/src/presentations/connection/domain/entities/post_entity.dart'
    as _i33;
import 'package:jobspot/src/presentations/connection/screen/connection_page.dart'
    as _i9;
import 'package:jobspot/src/presentations/forgot_password/screen/forgot_password_page.dart'
    as _i10;
import 'package:jobspot/src/presentations/home/screen/home_page.dart' as _i11;
import 'package:jobspot/src/presentations/job_description/screen/job_description_page.dart'
    as _i12;
import 'package:jobspot/src/presentations/job_position/screen/job_position_page.dart'
    as _i13;
import 'package:jobspot/src/presentations/location/screen/location_page.dart'
    as _i14;
import 'package:jobspot/src/presentations/main/screen/main_page.dart' as _i15;
import 'package:jobspot/src/presentations/notification/screen/notification_page.dart'
    as _i16;
import 'package:jobspot/src/presentations/on_boarding/screen/on_boarding_page.dart'
    as _i17;
import 'package:jobspot/src/presentations/save_job/screen/save_job_page.dart'
    as _i19;
import 'package:jobspot/src/presentations/sign_in/screen/sign_in_page.dart'
    as _i20;
import 'package:jobspot/src/presentations/sign_up/screen/sign_up_page.dart'
    as _i21;
import 'package:jobspot/src/presentations/verify_email/screen/verify_email_page.dart'
    as _i22;
import 'package:jobspot/src/presentations/verify_success/screen/verify_success_page.dart'
    as _i23;
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart'
    as _i32;
import 'package:jobspot/src/presentations/view_job/screen/view_job_page.dart'
    as _i24;
import 'package:jobspot/src/presentations/view_post/screen/view_post_page.dart'
    as _i25;

abstract class $AppRouter extends _i26.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    AboutTab.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutTab(),
      );
    },
    AddEducationRoute.name: (routeData) {
      final args = routeData.argsAs<AddEducationRouteArgs>(
          orElse: () => const AddEducationRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
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
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddJobPage(
          key: args.key,
          job: args.job,
        ),
      );
    },
    AddPostRoute.name: (routeData) {
      final args = routeData.argsAs<AddPostRouteArgs>(
          orElse: () => const AddPostRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AddPostPage(
          key: args.key,
          post: args.post,
        ),
      );
    },
    AddWorkExperienceRoute.name: (routeData) {
      final args = routeData.argsAs<AddWorkExperienceRouteArgs>(
          orElse: () => const AddWorkExperienceRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AddWorkExperiencePage(
          key: args.key,
          experience: args.experience,
        ),
      );
    },
    ApplicantProfileRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ApplicantProfilePage(),
      );
    },
    ApplyJobRoute.name: (routeData) {
      final args = routeData.argsAs<ApplyJobRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ApplyJobPage(
          key: args.key,
          job: args.job,
        ),
      );
    },
    CheckEmailRoute.name: (routeData) {
      final args = routeData.argsAs<CheckEmailRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CheckEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ConnectionRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ConnectionPage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForgotPasswordPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.HomePage(),
      );
    },
    JobDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<JobDescriptionRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.JobDescriptionPage(
          key: args.key,
          title: args.title,
          description: args.description,
          onBack: args.onBack,
        ),
      );
    },
    JobPositionRoute.name: (routeData) {
      final args = routeData.argsAs<JobPositionRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.JobPositionPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.LocationPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.MainPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.NotificationPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.OnBoardingPage(),
      );
    },
    PostTab.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PostTab(),
      );
    },
    SaveJobRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SaveJobPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SignUpPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.VerifyEmailPage(),
      );
    },
    VerifySuccessRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.VerifySuccessPage(),
      );
    },
    ViewJobRoute.name: (routeData) {
      final args = routeData.argsAs<ViewJobRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.ViewJobPage(
          key: args.key,
          postID: args.postID,
        ),
      );
    },
    ViewPostRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPostRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.ViewPostPage(
          key: args.key,
          post: args.post,
          isComment: args.isComment,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutTab]
class AboutTab extends _i26.PageRouteInfo<void> {
  const AboutTab({List<_i26.PageRouteInfo>? children})
      : super(
          AboutTab.name,
          initialChildren: children,
        );

  static const String name = 'AboutTab';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddEducationPage]
class AddEducationRoute extends _i26.PageRouteInfo<AddEducationRouteArgs> {
  AddEducationRoute({
    _i27.Key? key,
    _i28.UpdateEducationEntity? education,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          AddEducationRoute.name,
          args: AddEducationRouteArgs(
            key: key,
            education: education,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEducationRoute';

  static const _i26.PageInfo<AddEducationRouteArgs> page =
      _i26.PageInfo<AddEducationRouteArgs>(name);
}

class AddEducationRouteArgs {
  const AddEducationRouteArgs({
    this.key,
    this.education,
  });

  final _i27.Key? key;

  final _i28.UpdateEducationEntity? education;

  @override
  String toString() {
    return 'AddEducationRouteArgs{key: $key, education: $education}';
  }
}

/// generated route for
/// [_i3.AddJobPage]
class AddJobRoute extends _i26.PageRouteInfo<AddJobRouteArgs> {
  AddJobRoute({
    _i27.Key? key,
    _i29.UpdateJobEntity? job,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          AddJobRoute.name,
          args: AddJobRouteArgs(
            key: key,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'AddJobRoute';

  static const _i26.PageInfo<AddJobRouteArgs> page =
      _i26.PageInfo<AddJobRouteArgs>(name);
}

class AddJobRouteArgs {
  const AddJobRouteArgs({
    this.key,
    this.job,
  });

  final _i27.Key? key;

  final _i29.UpdateJobEntity? job;

  @override
  String toString() {
    return 'AddJobRouteArgs{key: $key, job: $job}';
  }
}

/// generated route for
/// [_i4.AddPostPage]
class AddPostRoute extends _i26.PageRouteInfo<AddPostRouteArgs> {
  AddPostRoute({
    _i27.Key? key,
    _i30.UpdatePostEntity? post,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          AddPostRoute.name,
          args: AddPostRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i26.PageInfo<AddPostRouteArgs> page =
      _i26.PageInfo<AddPostRouteArgs>(name);
}

class AddPostRouteArgs {
  const AddPostRouteArgs({
    this.key,
    this.post,
  });

  final _i27.Key? key;

  final _i30.UpdatePostEntity? post;

  @override
  String toString() {
    return 'AddPostRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i5.AddWorkExperiencePage]
class AddWorkExperienceRoute
    extends _i26.PageRouteInfo<AddWorkExperienceRouteArgs> {
  AddWorkExperienceRoute({
    _i27.Key? key,
    _i31.UpdateWorkExperienceEntity? experience,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          AddWorkExperienceRoute.name,
          args: AddWorkExperienceRouteArgs(
            key: key,
            experience: experience,
          ),
          initialChildren: children,
        );

  static const String name = 'AddWorkExperienceRoute';

  static const _i26.PageInfo<AddWorkExperienceRouteArgs> page =
      _i26.PageInfo<AddWorkExperienceRouteArgs>(name);
}

class AddWorkExperienceRouteArgs {
  const AddWorkExperienceRouteArgs({
    this.key,
    this.experience,
  });

  final _i27.Key? key;

  final _i31.UpdateWorkExperienceEntity? experience;

  @override
  String toString() {
    return 'AddWorkExperienceRouteArgs{key: $key, experience: $experience}';
  }
}

/// generated route for
/// [_i6.ApplicantProfilePage]
class ApplicantProfileRoute extends _i26.PageRouteInfo<void> {
  const ApplicantProfileRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ApplicantProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicantProfileRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ApplyJobPage]
class ApplyJobRoute extends _i26.PageRouteInfo<ApplyJobRouteArgs> {
  ApplyJobRoute({
    _i27.Key? key,
    required _i32.JobEntity job,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ApplyJobRoute.name,
          args: ApplyJobRouteArgs(
            key: key,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'ApplyJobRoute';

  static const _i26.PageInfo<ApplyJobRouteArgs> page =
      _i26.PageInfo<ApplyJobRouteArgs>(name);
}

class ApplyJobRouteArgs {
  const ApplyJobRouteArgs({
    this.key,
    required this.job,
  });

  final _i27.Key? key;

  final _i32.JobEntity job;

  @override
  String toString() {
    return 'ApplyJobRouteArgs{key: $key, job: $job}';
  }
}

/// generated route for
/// [_i8.CheckEmailPage]
class CheckEmailRoute extends _i26.PageRouteInfo<CheckEmailRouteArgs> {
  CheckEmailRoute({
    _i27.Key? key,
    required String email,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          CheckEmailRoute.name,
          args: CheckEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckEmailRoute';

  static const _i26.PageInfo<CheckEmailRouteArgs> page =
      _i26.PageInfo<CheckEmailRouteArgs>(name);
}

class CheckEmailRouteArgs {
  const CheckEmailRouteArgs({
    this.key,
    required this.email,
  });

  final _i27.Key? key;

  final String email;

  @override
  String toString() {
    return 'CheckEmailRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i9.ConnectionPage]
class ConnectionRoute extends _i26.PageRouteInfo<void> {
  const ConnectionRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ConnectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectionRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ForgotPasswordPage]
class ForgotPasswordRoute extends _i26.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i12.JobDescriptionPage]
class JobDescriptionRoute extends _i26.PageRouteInfo<JobDescriptionRouteArgs> {
  JobDescriptionRoute({
    _i27.Key? key,
    required String title,
    required String description,
    required dynamic Function(String) onBack,
    List<_i26.PageRouteInfo>? children,
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

  static const _i26.PageInfo<JobDescriptionRouteArgs> page =
      _i26.PageInfo<JobDescriptionRouteArgs>(name);
}

class JobDescriptionRouteArgs {
  const JobDescriptionRouteArgs({
    this.key,
    required this.title,
    required this.description,
    required this.onBack,
  });

  final _i27.Key? key;

  final String title;

  final String description;

  final dynamic Function(String) onBack;

  @override
  String toString() {
    return 'JobDescriptionRouteArgs{key: $key, title: $title, description: $description, onBack: $onBack}';
  }
}

/// generated route for
/// [_i13.JobPositionPage]
class JobPositionRoute extends _i26.PageRouteInfo<JobPositionRouteArgs> {
  JobPositionRoute({
    _i27.Key? key,
    required dynamic Function(String) onBack,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          JobPositionRoute.name,
          args: JobPositionRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPositionRoute';

  static const _i26.PageInfo<JobPositionRouteArgs> page =
      _i26.PageInfo<JobPositionRouteArgs>(name);
}

class JobPositionRouteArgs {
  const JobPositionRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i27.Key? key;

  final dynamic Function(String) onBack;

  @override
  String toString() {
    return 'JobPositionRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i14.LocationPage]
class LocationRoute extends _i26.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i27.Key? key,
    required dynamic Function(int) onBack,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i26.PageInfo<LocationRouteArgs> page =
      _i26.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i27.Key? key;

  final dynamic Function(int) onBack;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i15.MainPage]
class MainRoute extends _i26.PageRouteInfo<void> {
  const MainRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i16.NotificationPage]
class NotificationRoute extends _i26.PageRouteInfo<void> {
  const NotificationRoute({List<_i26.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i17.OnBoardingPage]
class OnBoardingRoute extends _i26.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i26.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PostTab]
class PostTab extends _i26.PageRouteInfo<void> {
  const PostTab({List<_i26.PageRouteInfo>? children})
      : super(
          PostTab.name,
          initialChildren: children,
        );

  static const String name = 'PostTab';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SaveJobPage]
class SaveJobRoute extends _i26.PageRouteInfo<void> {
  const SaveJobRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SaveJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'SaveJobRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SignInPage]
class SignInRoute extends _i26.PageRouteInfo<void> {
  const SignInRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SignUpPage]
class SignUpRoute extends _i26.PageRouteInfo<void> {
  const SignUpRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i22.VerifyEmailPage]
class VerifyEmailRoute extends _i26.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i26.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i23.VerifySuccessPage]
class VerifySuccessRoute extends _i26.PageRouteInfo<void> {
  const VerifySuccessRoute({List<_i26.PageRouteInfo>? children})
      : super(
          VerifySuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifySuccessRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ViewJobPage]
class ViewJobRoute extends _i26.PageRouteInfo<ViewJobRouteArgs> {
  ViewJobRoute({
    _i27.Key? key,
    required String postID,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ViewJobRoute.name,
          args: ViewJobRouteArgs(
            key: key,
            postID: postID,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewJobRoute';

  static const _i26.PageInfo<ViewJobRouteArgs> page =
      _i26.PageInfo<ViewJobRouteArgs>(name);
}

class ViewJobRouteArgs {
  const ViewJobRouteArgs({
    this.key,
    required this.postID,
  });

  final _i27.Key? key;

  final String postID;

  @override
  String toString() {
    return 'ViewJobRouteArgs{key: $key, postID: $postID}';
  }
}

/// generated route for
/// [_i25.ViewPostPage]
class ViewPostRoute extends _i26.PageRouteInfo<ViewPostRouteArgs> {
  ViewPostRoute({
    _i27.Key? key,
    required _i33.PostEntity post,
    bool isComment = false,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ViewPostRoute.name,
          args: ViewPostRouteArgs(
            key: key,
            post: post,
            isComment: isComment,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewPostRoute';

  static const _i26.PageInfo<ViewPostRouteArgs> page =
      _i26.PageInfo<ViewPostRouteArgs>(name);
}

class ViewPostRouteArgs {
  const ViewPostRouteArgs({
    this.key,
    required this.post,
    this.isComment = false,
  });

  final _i27.Key? key;

  final _i33.PostEntity post;

  final bool isComment;

  @override
  String toString() {
    return 'ViewPostRouteArgs{key: $key, post: $post, isComment: $isComment}';
  }
}
