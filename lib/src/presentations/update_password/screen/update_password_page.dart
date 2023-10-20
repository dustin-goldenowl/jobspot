import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart';
import 'package:jobspot/src/presentations/update_password/screen/update_password_view.dart';

@RoutePage()
class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdatePasswordCubit>(),
      child: const UpdatePasswordView(),
    );
  }
}
