import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/cubit/edit_applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/screen/edit_applicant_profile_view.dart';

@RoutePage()
class EditApplicantProfilePage extends StatelessWidget {
  const EditApplicantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditApplicantProfileCubit>(),
      child: const EditApplicantProfileView(),
    );
  }
}
