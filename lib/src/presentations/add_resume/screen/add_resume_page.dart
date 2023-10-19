import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_resume/cubit/add_resume_cubit.dart';
import 'package:jobspot/src/presentations/add_resume/screen/add_resume_view.dart';

@RoutePage()
class AddResumePage extends StatelessWidget {
  const AddResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddResumeCubit>(),
      child: const AddResumeView(),
    );
  }
}
