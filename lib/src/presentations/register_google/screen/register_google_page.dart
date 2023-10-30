import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/register_google/cubit/register_google_cubit.dart';
import 'package:jobspot/src/presentations/register_google/screen/register_google_view.dart';

@RoutePage()
class RegisterGooglePage extends StatelessWidget {
  const RegisterGooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterGoogleCubit>(),
      child: const RegisterGoogleView(),
    );
  }
}
