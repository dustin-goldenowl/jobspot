import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';
import 'package:jobspot/src/presentations/add_skill/screen/add_skill_view.dart';

@RoutePage()
class AddSkillPage extends StatelessWidget {
  const AddSkillPage({super.key, required this.listSkill});

  final List<SkillEntity> listSkill;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddSkillCubit>()..initListSkill(listSkill),
      child: const AddSkillView(),
    );
  }
}
