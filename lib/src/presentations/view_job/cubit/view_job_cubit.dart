import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart';

part 'view_job_state.dart';

@injectable
class ViewJobCubit extends Cubit<ViewJobState> {
  final ScrollController scrollController = ScrollController();

  final FetchJobUseCase _fetchJobUseCase;
  final SaveJobUseCase _saveJobUseCase;

  String? _jobID;

  String? get jobID => _jobID;

  ViewJobCubit(this._fetchJobUseCase, this._saveJobUseCase)
      : super(ViewJobState.ds()) {
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          240 - 2 * AppBar().preferredSize.height;
      changeIsTop(isTop);
    });
  }

  void changeIsTop(bool isTop) => emit(state.copyWith(isTop: isTop));

  Future fetchJobData([String? id]) async {
    _jobID ??= id;
    emit(state.copyWith(
        isSave: PrefsUtils.getUserInfo()?.saveJob?.contains(_jobID)));
    final response = await _fetchJobUseCase.call(params: _jobID!);
    emit(state.copyWith(dataState: response));
  }

  Future saveJob() async {
    if (_jobID != null && _jobID!.isNotEmpty) {
      bool isSave =
          PrefsUtils.getUserInfo()?.saveJob?.contains(_jobID) ?? false;
      emit(state.copyWith(isSave: !isSave));
      final response = await _saveJobUseCase.call(params: _jobID!);
      if (response is DataFailed) {
        emit(state.copyWith(isSave: isSave));
      }
    }
  }

  void readMore() =>
      emit(state.copyWith(dataState: state.dataState, isReadMore: true));

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
