import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/edit_company_profile/cubit/edit_company_profile_cubit.dart';
import 'package:jobspot/src/presentations/edit_company_profile/screen/edit_company_profile_view.dart';

@RoutePage()
class EditCompanyProfilePage extends StatelessWidget {
  const EditCompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditCompanyProfileCubit>(),
      child: const EditCompanyProfileView(),
    );
  }
}
