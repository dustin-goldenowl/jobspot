import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/sign_in/cubit/sign_in_cubit.dart';
import 'package:jobspot/src/presentations/sign_in/screen/sign_in_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (!getIt.isRegistered<AppLocalizations>()) {
      getIt.registerSingleton(AppLocalizations.of(context)!);
    }

    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: const SignInView(),
    );
  }
}
