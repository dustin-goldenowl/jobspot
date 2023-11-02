import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/service/network_service.dart';
import 'package:jobspot/src/core/service/firebase_messaging_service.dart';
import 'package:jobspot/src/presentations/main/cubit/main_cubit.dart';
import 'package:jobspot/src/presentations/main/screen/main_view.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<NetworkService>().initialise(context);
    FirebaseMessagingService.setupNotification(context);
    return BlocProvider(
      create: (_) => MainCubit(),
      child: const MainView(),
    );
  }
}
