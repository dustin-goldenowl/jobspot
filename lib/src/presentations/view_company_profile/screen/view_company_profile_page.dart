import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/view_company_profile/cubit/view_company_profile_cubit.dart';
import 'package:jobspot/src/presentations/view_company_profile/screen/view_company_profile_view.dart';

@RoutePage()
class ViewCompanyProfilePage extends StatelessWidget {
  const ViewCompanyProfilePage({super.key, required this.uid});

  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewCompanyProfileCubit>(),
      child: const ViewCompanyProfileView(),
    );
  }
}
