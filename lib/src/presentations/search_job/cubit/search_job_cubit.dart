import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/function/get_location.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/filter/domain/entities/filter_entity.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart';
import 'package:jobspot/src/presentations/home_applicant/widgets/bottom_sheet_job_option_view.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/router/search_job_coordinator.dart';
import 'package:jobspot/src/presentations/search_job/domain/use_cases/search_job_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

part 'search_job_state.dart';

@injectable
class SearchJobCubit extends Cubit<SearchJobState> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  int _limit = 15;

  SearchEntity _searchEntity =
      SearchEntity(limit: 15, query: "", lastUpdate: 3);

  final SearchJobUseCase _searchJobUseCase;
  final SaveJobUseCase _saveJobUseCase;

  SearchJobCubit(
    this._searchJobUseCase,
    this._saveJobUseCase,
  ) : super(SearchJobState.ds()) {
    final context = getIt<AppRouter>().navigatorKey.currentState!.context;
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
    searchController.addListener(() {
      _searchEntity = _searchEntity.copyWith(query: searchController.text);
      emit(state.copyWith(
        listJob: state.listJob,
        query: searchController.text,
      ));
    });
  }

  void init({bool? isRemote, int? fulltime}) {
    int? typeWorkplace = isRemote != null && isRemote ? 2 : null;
    _searchEntity =
        _searchEntity.copyWith(typeWorkplace: typeWorkplace, jobType: fulltime);
    searchJob();
  }

  Future searchJob({int limit = 15, bool isLoading = true}) async {
    emit(state.copyWith(
      listJob: isLoading ? null : state.listJob,
      isMore: true,
    ));
    final response = await _searchJobUseCase.call(
        params: _searchEntity.copyWith(limit: limit));
    if (response is DataSuccess) {
      _limit = response.data!.limit;
      emit(state.copyWith(
        listJob: response.data!.listJob,
        isMore: response.data!.isMore,
      ));
    }
  }

  Future saveJob(String jobID) async {
    final response = await _saveJobUseCase.call(params: jobID);
    if (response is DataSuccess) {
      emit(state.copyWith(
        listJob: state.listJob,
        saveJobID: jobID,
        isSave: PrefsUtils.getUserInfo()?.saveJob?.contains(jobID),
      ));
    }
  }

  void showBottomSheetOption(BuildContext context, {required JobEntity job}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => BottomSheetJobOptionView(
        job: job,
        onSave: () => saveJob(job.id),
        onApply: () => SearchJobCoordinator.showApplyJob(job),
      ),
    );
  }

  void changeFilter(FilterEntity filter) {
    _searchEntity = _searchEntity.copyWith(
      jobType: filter.jobType,
      lastUpdate: filter.lastUpdate,
      level: filter.level,
      salary: filter.salary,
      typeWorkplace: filter.typeWorkplace,
    );
    searchJob();
  }

  FilterEntity get filter => FilterEntity(
        jobType: _searchEntity.jobType,
        lastUpdate: _searchEntity.lastUpdate,
        level: _searchEntity.level,
        salary: _searchEntity.salary,
        typeWorkplace: _searchEntity.typeWorkplace,
      );

  void setLocation(int code) {
    _searchEntity = _searchEntity.copyWith(location: code);
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
