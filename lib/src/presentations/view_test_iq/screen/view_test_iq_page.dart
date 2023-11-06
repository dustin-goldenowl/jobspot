import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/view_test_iq/cubit/view_test_iq_cubit.dart';
import 'package:jobspot/src/presentations/view_test_iq/screen/view_test_iq_view.dart';

@RoutePage()
class ViewTestIQPage extends StatelessWidget {
  const ViewTestIQPage({super.key, required this.resultIQ, required this.time});

  final List<int?> resultIQ;
  final int time;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewTestIQCubit>()..getListQuestion(resultIQ),
      child: ViewTestIQView(time: time),
    );
  }
}
