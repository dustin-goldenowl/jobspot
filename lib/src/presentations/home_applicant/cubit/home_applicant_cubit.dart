import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/entities/fetch_job_data.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/fetch_job_use_case.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart';

part 'home_applicant_state.dart';

@injectable
class HomeApplicantCubit extends Cubit<HomeApplicantState> {
  final FetchJobUseCase _useCase;
  final SaveJobUseCase _saveJobUseCase;
  StreamSubscription? _subscription;

  HomeApplicantCubit(this._useCase, this._saveJobUseCase)
      : super(const HomeApplicantState());

  void fetchJobData() {
    emit(state.copyWith());
    if (_subscription != null) _subscription!.cancel();
    _subscription = _useCase.call().listen((event) {
      emit(state.copyWith(data: event.data, error: event.error));
    });
  }

  Future saveJob(String jobID) async {
    final response = await _saveJobUseCase.call(params: jobID);
    if (response is DataSuccess) {
      emit(state.copyWith(jobID: jobID));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription!.cancel();
    return super.close();
  }
}
