import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/home_company/cubit/home_company_cubit.dart';
import 'package:jobspot/src/presentations/home_company/screen/home_company_view.dart';

@RoutePage()
class HomeCompanyPage extends StatelessWidget {
  const HomeCompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCompanyCubit>()..getListMyJob(),
      child: const HomeCompanyView(),
    );
  }
}
