import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart';
import 'package:jobspot/src/presentations/add_work_experience/screen/add_work_experience_view.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';

@RoutePage()
class AddWorkExperiencePage extends StatelessWidget {
  const AddWorkExperiencePage({
    super.key,
    required this.onSave,
    required this.onRemove,
  });

  final Function(WorkExperienceEntity experience) onSave;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddWorkExperienceCubit(onRemove: onRemove, onSave: onSave),
      child: const AddWorkExperienceView(),
    );
  }
}
