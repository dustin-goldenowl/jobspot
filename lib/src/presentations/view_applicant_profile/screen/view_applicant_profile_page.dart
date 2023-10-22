import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/cubit/view_applicant_profile_cubit.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/screen/view_applicant_profile_view.dart';

@RoutePage()
class ViewApplicantProfilePage extends StatelessWidget {
  const ViewApplicantProfilePage({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewApplicantProfileCubit>()..init(uid),
      child: const ViewApplicantProfileView(),
    );
  }
}
