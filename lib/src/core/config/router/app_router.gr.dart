// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:jobspot/src/presentations/on_boarding/screen/on_boarding_page.dart'
    as _i1;
import 'package:jobspot/src/presentations/sign_in/screen/sign_in_page.dart'
    as _i2;
import 'package:jobspot/src/presentations/sign_up/screen/sign_up_page.dart'
    as _i3;
import 'package:jobspot/src/presentations/verify_email/screen/verify_email_page.dart'
    as _i4;
import 'package:jobspot/src/presentations/verify_success/screen/verify_success_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    OnBoardingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.OnBoardingPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.VerifyEmailPage(),
      );
    },
    VerifySuccessRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.VerifySuccessPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingRoute extends _i6.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.VerifyEmailPage]
class VerifyEmailRoute extends _i6.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i6.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.VerifySuccessPage]
class VerifySuccessRoute extends _i6.PageRouteInfo<void> {
  const VerifySuccessRoute({List<_i6.PageRouteInfo>? children})
      : super(
          VerifySuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifySuccessRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
