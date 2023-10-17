import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart';
import 'package:jobspot/src/presentations/save_job/screen/save_job_view.dart';

@RoutePage()
class SaveJobPage extends StatelessWidget {
  const SaveJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SaveJobCubit>()..listenSaveJob(),
      child: const SaveJobView(),
    );
  }
}
