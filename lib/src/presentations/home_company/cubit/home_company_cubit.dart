import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/my_job_entity.dart';
import 'package:jobspot/src/presentations/home_company/domain/use_cases/get_list_my_job_use_case.dart';

part 'home_company_state.dart';

@injectable
class HomeCompanyCubit extends Cubit<HomeCompanyState> {
  ScrollController scrollController = ScrollController();

  int _limit = 15;

  final GetListMyJobUseCase _useCase;

  HomeCompanyCubit(this._useCase)
      : super(const HomeCompanyState(isMore: true)) {
    getListMyJob();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getListMyJob(limit: _limit + 15, isLoading: false);
      }
    });
  }

  Future getListMyJob({int limit = 15, bool isLoading = true}) async {
    emit(state.copyWith(jobs: isLoading ? null : state.jobs, isMore: true));
    final response = await _useCase.call(params: limit);
    if (response is DataSuccess) {
      _limit = response.data!.limit;
      emit(state.copyWith(
        jobs: response.data!.jobs,
        isMore: response.data!.isMore,
      ));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
