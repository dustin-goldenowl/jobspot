import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/test_iq/cubit/test_iq_cubit.dart';
import 'package:jobspot/src/presentations/test_iq/screen/test_iq_view.dart';

@RoutePage()
class TestIQPage extends StatelessWidget {
  const TestIQPage({super.key, required this.applyID});

  final String applyID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TestIQCubit>()..init(applyID),
      child: const TestIQView(),
    );
  }
}
