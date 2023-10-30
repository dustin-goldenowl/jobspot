import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/home_admin/cubit/home_admin_cubit.dart';
import 'package:jobspot/src/presentations/home_admin/screen/home_admin_view.dart';

@RoutePage()
class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeAdminCubit>(),
      child: const HomeAdminView(),
    );
  }
}
