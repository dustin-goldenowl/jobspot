import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart';
import 'package:jobspot/src/presentations/view_job/screen/view_job_view.dart';

@RoutePage()
class ViewJobPage extends StatelessWidget {
  const ViewJobPage({super.key, required this.jobID});

  final String jobID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewJobCubit>()..fetchJobData(jobID),
      child: const ViewJobView(),
    );
  }
}
