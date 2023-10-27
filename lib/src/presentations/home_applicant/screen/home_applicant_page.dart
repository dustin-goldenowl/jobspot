import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/home_applicant/cubit/home_applicant_cubit.dart';
import 'package:jobspot/src/presentations/home_applicant/screen/home_applicant_view.dart';

@RoutePage()
class HomeApplicantPage extends StatelessWidget {
  const HomeApplicantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeApplicantCubit>()..fetchJobData(),
      child: const HomeApplicantView(),
    );
  }
}
