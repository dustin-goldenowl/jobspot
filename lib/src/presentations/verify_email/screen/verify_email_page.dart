import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/verify_email/cubit/verify_email_cubit.dart';
import 'package:jobspot/src/presentations/verify_email/screen/verify_email_view.dart';

@RoutePage()
class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyEmailCubit()..sendVerifyEmail(),
      child: const VerifyEmailView(),
    );
  }
}
