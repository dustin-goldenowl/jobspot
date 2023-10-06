import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/connection/cubit/connection_cubit.dart';
import 'package:jobspot/src/presentations/connection/screen/connection_view.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ConnectionCubit(),
      child: const ConnectionView(),
    );
  }
}
