import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart';
import 'package:jobspot/src/presentations/add_work_experience/screen/add_work_experience_view.dart';

@RoutePage()
class AddWorkExperiencePage extends StatelessWidget {
  const AddWorkExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddWorkExperienceCubit>(),
      child: const AddWorkExperienceView(),
    );
  }
}
