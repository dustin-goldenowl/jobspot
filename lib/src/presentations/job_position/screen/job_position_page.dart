import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart';
import 'package:jobspot/src/presentations/job_position/screen/job_positon_view.dart';

@RoutePage()
class JobPositionPage extends StatelessWidget {
  const JobPositionPage({super.key, required this.onBack});

  final Function(String jobTitle) onBack;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<JobPositionCubit>()..searchJobPosition(),
      child: JobPositionView(onBack: onBack),
    );
  }
}
