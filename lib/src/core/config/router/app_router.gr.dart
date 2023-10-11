// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart'
    as _i16;
import 'package:jobspot/src/presentations/add_job/screen/add_job_page.dart'
    as _i1;
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart'
    as _i17;
import 'package:jobspot/src/presentations/add_post/screen/add_post_page.dart'
    as _i2;
import 'package:jobspot/src/presentations/check_email/screen/check_email_page.dart'
    as _i3;
import 'package:jobspot/src/presentations/forgot_password/screen/forgot_password_page.dart'
    as _i4;
import 'package:jobspot/src/presentations/job_description/screen/job_description_page.dart'
    as _i5;
import 'package:jobspot/src/presentations/job_position/screen/job_position_page.dart'
    as _i6;
import 'package:jobspot/src/presentations/location/screen/location_page.dart'
    as _i7;
import 'package:jobspot/src/presentations/main/screen/main_page.dart' as _i8;
import 'package:jobspot/src/presentations/on_boarding/screen/on_boarding_page.dart'
    as _i9;
import 'package:jobspot/src/presentations/sign_in/screen/sign_in_page.dart'
    as _i10;
import 'package:jobspot/src/presentations/sign_up/screen/sign_up_page.dart'
    as _i11;
import 'package:jobspot/src/presentations/verify_email/screen/verify_email_page.dart'
    as _i12;
import 'package:jobspot/src/presentations/verify_success/screen/verify_success_page.dart'
    as _i13;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AddJobRoute.name: (routeData) {
      final args = routeData.argsAs<AddJobRouteArgs>(
          orElse: () => const AddJobRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddJobPage(
          key: args.key,
          job: args.job,
        ),
      );
    },
    AddPostRoute.name: (routeData) {
      final args = routeData.argsAs<AddPostRouteArgs>(
          orElse: () => const AddPostRouteArgs());
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddPostPage(
          key: args.key,
          post: args.post,
        ),
      );
    },
    CheckEmailRoute.name: (routeData) {
      final args = routeData.argsAs<CheckEmailRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CheckEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    JobDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<JobDescriptionRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.JobDescriptionPage(
          key: args.key,
          onBack: args.onBack,
          description: args.description,
        ),
      );
    },
    JobPositionRoute.name: (routeData) {
      final args = routeData.argsAs<JobPositionRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.JobPositionPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LocationPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MainPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnBoardingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignUpPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.VerifyEmailPage(),
      );
    },
    VerifySuccessRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.VerifySuccessPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddJobPage]
class AddJobRoute extends _i14.PageRouteInfo<AddJobRouteArgs> {
  AddJobRoute({
    _i15.Key? key,
    _i16.UpdateJobEntity? job,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          AddJobRoute.name,
          args: AddJobRouteArgs(
            key: key,
            job: job,
          ),
          initialChildren: children,
        );

  static const String name = 'AddJobRoute';

  static const _i14.PageInfo<AddJobRouteArgs> page =
      _i14.PageInfo<AddJobRouteArgs>(name);
}

class AddJobRouteArgs {
  const AddJobRouteArgs({
    this.key,
    this.job,
  });

  final _i15.Key? key;

  final _i16.UpdateJobEntity? job;

  @override
  String toString() {
    return 'AddJobRouteArgs{key: $key, job: $job}';
  }
}

/// generated route for
/// [_i2.AddPostPage]
class AddPostRoute extends _i14.PageRouteInfo<AddPostRouteArgs> {
  AddPostRoute({
    _i15.Key? key,
    _i17.UpdatePostEntity? post,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          AddPostRoute.name,
          args: AddPostRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i14.PageInfo<AddPostRouteArgs> page =
      _i14.PageInfo<AddPostRouteArgs>(name);
}

class AddPostRouteArgs {
  const AddPostRouteArgs({
    this.key,
    this.post,
  });

  final _i15.Key? key;

  final _i17.UpdatePostEntity? post;

  @override
  String toString() {
    return 'AddPostRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i3.CheckEmailPage]
class CheckEmailRoute extends _i14.PageRouteInfo<CheckEmailRouteArgs> {
  CheckEmailRoute({
    _i15.Key? key,
    required String email,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CheckEmailRoute.name,
          args: CheckEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckEmailRoute';

  static const _i14.PageInfo<CheckEmailRouteArgs> page =
      _i14.PageInfo<CheckEmailRouteArgs>(name);
}

class CheckEmailRouteArgs {
  const CheckEmailRouteArgs({
    this.key,
    required this.email,
  });

  final _i15.Key? key;

  final String email;

  @override
  String toString() {
    return 'CheckEmailRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.JobDescriptionPage]
class JobDescriptionRoute extends _i14.PageRouteInfo<JobDescriptionRouteArgs> {
  JobDescriptionRoute({
    _i15.Key? key,
    required dynamic Function(String) onBack,
    required String description,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          JobDescriptionRoute.name,
          args: JobDescriptionRouteArgs(
            key: key,
            onBack: onBack,
            description: description,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDescriptionRoute';

  static const _i14.PageInfo<JobDescriptionRouteArgs> page =
      _i14.PageInfo<JobDescriptionRouteArgs>(name);
}

class JobDescriptionRouteArgs {
  const JobDescriptionRouteArgs({
    this.key,
    required this.onBack,
    required this.description,
  });

  final _i15.Key? key;

  final dynamic Function(String) onBack;

  final String description;

  @override
  String toString() {
    return 'JobDescriptionRouteArgs{key: $key, onBack: $onBack, description: $description}';
  }
}

/// generated route for
/// [_i6.JobPositionPage]
class JobPositionRoute extends _i14.PageRouteInfo<JobPositionRouteArgs> {
  JobPositionRoute({
    _i15.Key? key,
    required dynamic Function(String) onBack,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          JobPositionRoute.name,
          args: JobPositionRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPositionRoute';

  static const _i14.PageInfo<JobPositionRouteArgs> page =
      _i14.PageInfo<JobPositionRouteArgs>(name);
}

class JobPositionRouteArgs {
  const JobPositionRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i15.Key? key;

  final dynamic Function(String) onBack;

  @override
  String toString() {
    return 'JobPositionRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i7.LocationPage]
class LocationRoute extends _i14.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i15.Key? key,
    required dynamic Function(int) onBack,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i14.PageInfo<LocationRouteArgs> page =
      _i14.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i15.Key? key;

  final dynamic Function(int) onBack;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i8.MainPage]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnBoardingPage]
class OnBoardingRoute extends _i14.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i14.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<void> {
  const SignInRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignUpPage]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.VerifyEmailPage]
class VerifyEmailRoute extends _i14.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i14.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.VerifySuccessPage]
class VerifySuccessRoute extends _i14.PageRouteInfo<void> {
  const VerifySuccessRoute({List<_i14.PageRouteInfo>? children})
      : super(
          VerifySuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifySuccessRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
