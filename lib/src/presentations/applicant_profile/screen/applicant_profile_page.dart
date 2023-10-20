import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/applicant_profile/cubit/applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/applicant_profile/screen/applicant_profile_view.dart';

@RoutePage()
class ApplicantProfilePage extends StatelessWidget {
  const ApplicantProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ApplicantProfileCubit>(),
      child: const ApplicantProfileView(),
    );
  }
}
