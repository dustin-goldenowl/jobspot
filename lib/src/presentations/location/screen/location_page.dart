import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/location/cubit/location_cubit.dart';
import 'package:jobspot/src/presentations/location/screen/location_view.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({super.key, required this.onBack});

  final Function(int code) onBack;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: LocationView(onBack: onBack),
    );
  }
}
