import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';
import 'package:jobspot/src/presentations/add_job/screen/add_job_view.dart';

@RoutePage()
class AddJobPage extends StatelessWidget {
  const AddJobPage({super.key, this.job});

  final UpdateJobEntity? job;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddJobCubit>()..initUpdateJob(job),
      child: const AddJobView(),
    );
  }
}
