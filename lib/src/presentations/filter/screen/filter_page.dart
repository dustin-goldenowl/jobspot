import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/filter/cubit/filter_cubit.dart';
import 'package:jobspot/src/presentations/filter/domain/entities/filter_entity.dart';
import 'package:jobspot/src/presentations/filter/screen/filter_view.dart';

@RoutePage()
class FilterPage extends StatelessWidget {
  const FilterPage({super.key, required this.onBack, this.filter});

  final Function(FilterEntity entity) onBack;
  final FilterEntity? filter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterCubit()..init(filter),
      child: FilterView(onBack: onBack),
    );
  }
}
