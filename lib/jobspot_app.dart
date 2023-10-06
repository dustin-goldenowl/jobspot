import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';

import 'src/core/config/localization/app_localizations_setup.dart';
import 'src/core/constants/constants.dart';

class JobspotApp extends StatelessWidget {
  const JobspotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizationsSetup.supportedLocales,
      localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
      localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
      locale: const Locale("en"),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Open Sans",
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      routerConfig: getIt<AppRouter>().config(
        deepLinkBuilder: (deepLink) {
          if (PrefsUtils.isFirstOpen) {
            PrefsUtils.openedApp();
            return const DeepLink([OnBoardingRoute()]);
          } else {
            if (FirebaseAuth.instance.currentUser != null) {
              return const DeepLink([MainRoute()]);
            } else {
              return const DeepLink([SignInRoute()]);
            }
          }
        },
      ),
    );
  }
}
