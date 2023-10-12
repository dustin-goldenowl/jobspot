import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart';
import 'package:jobspot/src/presentations/apply_job/screen/apply_job_view.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@RoutePage()
class ApplyJobPage extends StatelessWidget {
  const ApplyJobPage({super.key, required this.job});

  final JobEntity job;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ApplyJobCubit>(),
      child: ApplyJobView(job: job),
    );
  }
}
