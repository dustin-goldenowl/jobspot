import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/screen/add_education_view.dart';

@RoutePage()
class AddEducationPage extends StatelessWidget {
  const AddEducationPage({super.key, this.education});

  final UpdateEducationEntity? education;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddEducationCubit>()..initEducation(education),
      child: const AddEducationView(),
    );
  }
}
