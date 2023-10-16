import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart';
import 'package:jobspot/src/presentations/connection/screen/connection_view.dart';

@RoutePage()
class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ConnectionCubit>()..fetchPostData(),
      child: const ConnectionView(),
    );
  }
}
