import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/use_cases/search_job_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

part 'search_job_state.dart';

@injectable
class SearchJobCubit extends Cubit<SearchJobState> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  final SearchJobUseCase _searchJobUseCase;

  SearchJobCubit(this._searchJobUseCase)
      : super(const SearchJobState(isTop: false)) {
    searchJob();
  }

  Future searchJob() async {
    final response = await _searchJobUseCase.call(
        params: SearchEntity(query: searchController.text));
    if (response is DataSuccess) {
      emit(state.copyWith(listJob: response.data));
    }
  }

  void listenScroll(BuildContext context) {
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          0.6 * MediaQuery.sizeOf(context).width -
              2 * AppBar().preferredSize.height;
      emit(state.copyWith(isTop: isTop));
    });
  }
}
