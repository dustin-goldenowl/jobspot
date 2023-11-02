import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/service/network_service.dart';
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart';
import 'package:jobspot/src/presentations/sign_up/screen/sign_up_view.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<NetworkService>().initialise(context);
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: const SignUpView(),
    );
  }
}
