import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/company_profile/cubit/company_profile_cubit.dart';
import 'package:jobspot/src/presentations/company_profile/screen/company_profile_view.dart';

@RoutePage()
class CompanyProfilePage extends StatelessWidget {
  const CompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CompanyProfileCubit>(),
      child: const CompanyProfileView(),
    );
  }
}
