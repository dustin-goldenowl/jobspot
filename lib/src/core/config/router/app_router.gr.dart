// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:jobspot/src/presentations/add_job/screen/add_job_page.dart'
    as _i1;
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart'
    as _i15;
import 'package:jobspot/src/presentations/add_post/screen/add_post_page.dart'
    as _i2;
import 'package:jobspot/src/presentations/check_email/screen/check_email_page.dart'
    as _i3;
import 'package:jobspot/src/presentations/forgot_password/screen/forgot_password_page.dart'
    as _i4;
import 'package:jobspot/src/presentations/job_position/screen/job_position_page.dart'
    as _i5;
import 'package:jobspot/src/presentations/location/screen/location_page.dart'
    as _i6;
import 'package:jobspot/src/presentations/main/screen/main_page.dart' as _i7;
import 'package:jobspot/src/presentations/on_boarding/screen/on_boarding_page.dart'
    as _i8;
import 'package:jobspot/src/presentations/sign_in/screen/sign_in_page.dart'
    as _i9;
import 'package:jobspot/src/presentations/sign_up/screen/sign_up_page.dart'
    as _i10;
import 'package:jobspot/src/presentations/verify_email/screen/verify_email_page.dart'
    as _i11;
import 'package:jobspot/src/presentations/verify_success/screen/verify_success_page.dart'
    as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AddJobRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddJobPage(),
      );
    },
    AddPostRoute.name: (routeData) {
      final args = routeData.argsAs<AddPostRouteArgs>(
          orElse: () => const AddPostRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddPostPage(
          key: args.key,
          post: args.post,
        ),
      );
    },
    CheckEmailRoute.name: (routeData) {
      final args = routeData.argsAs<CheckEmailRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CheckEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    JobPositionRoute.name: (routeData) {
      final args = routeData.argsAs<JobPositionRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.JobPositionPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LocationPage(
          key: args.key,
          onBack: args.onBack,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoardingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignUpPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.VerifyEmailPage(),
      );
    },
    VerifySuccessRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.VerifySuccessPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddJobPage]
class AddJobRoute extends _i13.PageRouteInfo<void> {
  const AddJobRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AddJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddJobRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddPostPage]
class AddPostRoute extends _i13.PageRouteInfo<AddPostRouteArgs> {
  AddPostRoute({
    _i14.Key? key,
    _i15.UpdatePostEntity? post,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          AddPostRoute.name,
          args: AddPostRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i13.PageInfo<AddPostRouteArgs> page =
      _i13.PageInfo<AddPostRouteArgs>(name);
}

class AddPostRouteArgs {
  const AddPostRouteArgs({
    this.key,
    this.post,
  });

  final _i14.Key? key;

  final _i15.UpdatePostEntity? post;

  @override
  String toString() {
    return 'AddPostRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i3.CheckEmailPage]
class CheckEmailRoute extends _i13.PageRouteInfo<CheckEmailRouteArgs> {
  CheckEmailRoute({
    _i14.Key? key,
    required String email,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CheckEmailRoute.name,
          args: CheckEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckEmailRoute';

  static const _i13.PageInfo<CheckEmailRouteArgs> page =
      _i13.PageInfo<CheckEmailRouteArgs>(name);
}

class CheckEmailRouteArgs {
  const CheckEmailRouteArgs({
    this.key,
    required this.email,
  });

  final _i14.Key? key;

  final String email;

  @override
  String toString() {
    return 'CheckEmailRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i13.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.JobPositionPage]
class JobPositionRoute extends _i13.PageRouteInfo<JobPositionRouteArgs> {
  JobPositionRoute({
    _i14.Key? key,
    required dynamic Function(String) onBack,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          JobPositionRoute.name,
          args: JobPositionRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'JobPositionRoute';

  static const _i13.PageInfo<JobPositionRouteArgs> page =
      _i13.PageInfo<JobPositionRouteArgs>(name);
}

class JobPositionRouteArgs {
  const JobPositionRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i14.Key? key;

  final dynamic Function(String) onBack;

  @override
  String toString() {
    return 'JobPositionRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i6.LocationPage]
class LocationRoute extends _i13.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i14.Key? key,
    required dynamic Function(int) onBack,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(
            key: key,
            onBack: onBack,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i13.PageInfo<LocationRouteArgs> page =
      _i13.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    this.key,
    required this.onBack,
  });

  final _i14.Key? key;

  final dynamic Function(int) onBack;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key, onBack: $onBack}';
  }
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnBoardingPage]
class OnBoardingRoute extends _i13.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignInPage]
class SignInRoute extends _i13.PageRouteInfo<void> {
  const SignInRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignUpPage]
class SignUpRoute extends _i13.PageRouteInfo<void> {
  const SignUpRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.VerifyEmailPage]
class VerifyEmailRoute extends _i13.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i13.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.VerifySuccessPage]
class VerifySuccessRoute extends _i13.PageRouteInfo<void> {
  const VerifySuccessRoute({List<_i13.PageRouteInfo>? children})
      : super(
          VerifySuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifySuccessRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
