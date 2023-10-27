import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart';
import 'package:jobspot/src/presentations/view_job_applicant/screen/view_job_applicant_view.dart';

@RoutePage()
class ViewJobApplicantPage extends StatelessWidget {
  const ViewJobApplicantPage(
      {super.key, required this.jobID, required this.title});

  final String jobID;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ViewJobApplicantCubit>()..getListApplicant(jobID),
      child: ViewJobApplicantView(title: title),
    );
  }
}
