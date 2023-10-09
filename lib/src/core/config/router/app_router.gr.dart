// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:jobspot/src/presentations/add_job/screen/add_job_page.dart'
    as _i1;
import 'package:jobspot/src/presentations/add_post/domain/entities/update_post_entity.dart'
    as _i14;
import 'package:jobspot/src/presentations/add_post/screen/add_post_page.dart'
    as _i2;
import 'package:jobspot/src/presentations/check_email/screen/check_email_page.dart'
    as _i3;
import 'package:jobspot/src/presentations/forgot_password/screen/forgot_password_page.dart'
    as _i4;
import 'package:jobspot/src/presentations/job_description/screen/job_description_page.dart'
    as _i5;
import 'package:jobspot/src/presentations/main/screen/main_page.dart' as _i6;
import 'package:jobspot/src/presentations/on_boarding/screen/on_boarding_page.dart'
    as _i7;
import 'package:jobspot/src/presentations/sign_in/screen/sign_in_page.dart'
    as _i8;
import 'package:jobspot/src/presentations/sign_up/screen/sign_up_page.dart'
    as _i9;
import 'package:jobspot/src/presentations/verify_email/screen/verify_email_page.dart'
    as _i10;
import 'package:jobspot/src/presentations/verify_success/screen/verify_success_page.dart'
    as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddJobRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddJobPage(),
      );
    },
    AddPostRoute.name: (routeData) {
      final args = routeData.argsAs<AddPostRouteArgs>(
          orElse: () => const AddPostRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddPostPage(
          key: args.key,
          post: args.post,
        ),
      );
    },
    CheckEmailRoute.name: (routeData) {
      final args = routeData.argsAs<CheckEmailRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CheckEmailPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPasswordPage(),
      );
    },
    JobDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<JobDescriptionRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.JobDescriptionPage(
          key: args.key,
          onBack: args.onBack,
          description: args.description,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnBoardingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignUpPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.VerifyEmailPage(),
      );
    },
    VerifySuccessRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.VerifySuccessPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddJobPage]
class AddJobRoute extends _i12.PageRouteInfo<void> {
  const AddJobRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddJobRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddJobRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddPostPage]
class AddPostRoute extends _i12.PageRouteInfo<AddPostRouteArgs> {
  AddPostRoute({
    _i13.Key? key,
    _i14.UpdatePostEntity? post,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          AddPostRoute.name,
          args: AddPostRouteArgs(
            key: key,
            post: post,
          ),
          initialChildren: children,
        );

  static const String name = 'AddPostRoute';

  static const _i12.PageInfo<AddPostRouteArgs> page =
      _i12.PageInfo<AddPostRouteArgs>(name);
}

class AddPostRouteArgs {
  const AddPostRouteArgs({
    this.key,
    this.post,
  });

  final _i13.Key? key;

  final _i14.UpdatePostEntity? post;

  @override
  String toString() {
    return 'AddPostRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [_i3.CheckEmailPage]
class CheckEmailRoute extends _i12.PageRouteInfo<CheckEmailRouteArgs> {
  CheckEmailRoute({
    _i13.Key? key,
    required String email,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CheckEmailRoute.name,
          args: CheckEmailRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'CheckEmailRoute';

  static const _i12.PageInfo<CheckEmailRouteArgs> page =
      _i12.PageInfo<CheckEmailRouteArgs>(name);
}

class CheckEmailRouteArgs {
  const CheckEmailRouteArgs({
    this.key,
    required this.email,
  });

  final _i13.Key? key;

  final String email;

  @override
  String toString() {
    return 'CheckEmailRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i12.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.JobDescriptionPage]
class JobDescriptionRoute extends _i12.PageRouteInfo<JobDescriptionRouteArgs> {
  JobDescriptionRoute({
    _i13.Key? key,
    required dynamic Function(String) onBack,
    required String description,
    List<_i12.PageRouteInfo>? children,
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

  static const _i12.PageInfo<JobDescriptionRouteArgs> page =
      _i12.PageInfo<JobDescriptionRouteArgs>(name);
}

class JobDescriptionRouteArgs {
  const JobDescriptionRouteArgs({
    this.key,
    required this.onBack,
    required this.description,
  });

  final _i13.Key? key;

  final dynamic Function(String) onBack;

  final String description;

  @override
  String toString() {
    return 'JobDescriptionRouteArgs{key: $key, onBack: $onBack, description: $description}';
  }
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnBoardingPage]
class OnBoardingRoute extends _i12.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignInPage]
class SignInRoute extends _i12.PageRouteInfo<void> {
  const SignInRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignUpPage]
class SignUpRoute extends _i12.PageRouteInfo<void> {
  const SignUpRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.VerifyEmailPage]
class VerifyEmailRoute extends _i12.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i12.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.VerifySuccessPage]
class VerifySuccessRoute extends _i12.PageRouteInfo<void> {
  const VerifySuccessRoute({List<_i12.PageRouteInfo>? children})
      : super(
          VerifySuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifySuccessRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
