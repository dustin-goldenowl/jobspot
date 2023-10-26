import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/function/get_location.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/use_cases/search_job_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

part 'search_job_state.dart';

@injectable
class SearchJobCubit extends Cubit<SearchJobState> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  int? _location;
  int _limit = 15;

  final SearchJobUseCase _searchJobUseCase;

  SearchJobCubit(this._searchJobUseCase) : super(SearchJobState.ds()) {
    searchJob();
    searchController.addListener(() {
      emit(state.copyWith(
        listJob: state.listJob,
        query: searchController.text,
      ));
    });
  }

  void listenScroll(BuildContext context) {
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          0.6 * MediaQuery.sizeOf(context).width -
              2 * AppBar().preferredSize.height;
      emit(state.copyWith(listJob: state.listJob, isTop: isTop));
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        searchJob(limit: _limit + 15, isLoading: false);
      }
    });
  }

  Future searchJob({int limit = 15, bool isLoading = true}) async {
    emit(state.copyWith(
      listJob: isLoading ? null : state.listJob,
      isMore: true,
    ));
    final response = await _searchJobUseCase.call(
        params: SearchEntity(
      limit: limit,
      query: searchController.text,
      location: _location,
    ));
    if (response is DataSuccess) {
      _limit = response.data!.limit;
      emit(state.copyWith(
        listJob: response.data!.listJob,
        isMore: response.data!.isMore,
      ));
    }
  }

  void setLocation(int code) {
    _location = code;
    locationController.text = "${getLocation(code) ?? ""} Việt Nam";
    searchJob();
  }

  @override
  Future<void> close() {
    searchController.dispose();
    locationController.dispose();
    scrollController.dispose();
    return super.close();
  }
}
