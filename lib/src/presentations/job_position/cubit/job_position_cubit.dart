import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart';

part 'job_position_state.dart';

@injectable
class JobPositionCubit extends Cubit<JobPositionState> {
  final SearchJobPositionUseCase _searchJobPositionUseCase;
  TextEditingController searchController = TextEditingController();

  JobPositionCubit(this._searchJobPositionUseCase)
      : super(const JobPositionState(text: "")) {
    searchController.addListener(() => searchJobPosition());
  }

  void searchJobPosition() async {
    final response =
        await _searchJobPositionUseCase.call(params: searchController.text);
    emit(state.copyWith(dataState: response, text: searchController.text));
  }
}
