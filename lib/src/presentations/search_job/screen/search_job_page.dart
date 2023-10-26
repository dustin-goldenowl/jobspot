import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/search_job/cubit/search_job_cubit.dart';
import 'package:jobspot/src/presentations/search_job/screen/search_job_view.dart';

@RoutePage()
class SearchJobPage extends StatelessWidget {
  const SearchJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchJobCubit>()..listenScroll(context),
      child: const SearchJobView(),
    );
  }
}
