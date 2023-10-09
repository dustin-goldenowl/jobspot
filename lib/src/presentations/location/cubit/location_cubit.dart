import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/constants/constants.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  TextEditingController searchController = TextEditingController();

  LocationCubit()
      : super(LocationState(provinces: AppLists.provinces, text: "")) {
    searchController.addListener(() => searchLocation());
  }

  void searchLocation() {
    emit(state.copyWith(
        text: searchController.text,
        provinces: AppLists.provinces
            .where((element) => (element["name"] as String)
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList()));
  }
}
