import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/localization/cubit/localization_cubit.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';

class JobspotApp extends StatelessWidget {
  const JobspotApp({super.key});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages("vi", timeago.ViMessages());
    timeago.setLocaleMessages("en", timeago.EnMessages());
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LocalizationCubit())],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        buildWhen: (previous, current) => previous.locale != current.locale,
        builder: (context, state) {
          timeago.setDefaultLocale(state.locale.languageCode);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: state.locale,
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)!.app_title,
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
                    if (PrefsUtils.getUserInfo()!.role == "admin") {
                      return const DeepLink([HomeAdminRoute()]);
                    }
                    return const DeepLink([MainRoute()]);
                  } else {
                    return const DeepLink([SignInRoute()]);
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
