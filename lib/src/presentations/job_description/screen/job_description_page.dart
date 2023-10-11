import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/job_description/cubit/job_description_cubit.dart';
import 'package:jobspot/src/presentations/job_description/screen/job_description_view.dart';

@RoutePage()
class JobDescriptionPage extends StatelessWidget {
  const JobDescriptionPage({
    super.key,
    required this.title,
    required this.description,
    required this.onBack,
  });

  final String title;
  final String description;
  final Function(String description) onBack;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobDescriptionCubit(description: description),
      child: JobDescriptionView(title: title, onBack: onBack),
    );
  }
}
