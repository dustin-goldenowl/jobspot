import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/add_job/cubit/add_job_cubit.dart';
import 'package:jobspot/src/presentations/add_job/screen/add_job_view.dart';

@RoutePage()
class AddJobPage extends StatelessWidget {
  const AddJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddJobCubit(),
      child: const AddJobView(),
    );
  }
}
