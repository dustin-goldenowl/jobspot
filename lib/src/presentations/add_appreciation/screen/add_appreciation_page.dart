import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/update_appreciation_entity.dart';
import 'package:jobspot/src/presentations/add_appreciation/screen/add_appreciation_view.dart';

@RoutePage()
class AddAppreciationPage extends StatelessWidget {
  const AddAppreciationPage({super.key, this.appreciation});

  final UpdateAppreciationEntity? appreciation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<AddAppreciationCubit>()..initAppreciation(appreciation),
      child: const AddAppreciationView(),
    );
  }
}
