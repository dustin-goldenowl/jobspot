import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/consider_resume.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/consider_resume_use_case.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/get_list_applicant_use_case.dart';

part 'view_job_applicant_state.dart';

@injectable
class ViewJobApplicantCubit extends Cubit<ViewJobApplicantState> {
  final GetListApplicantUseCase _getListApplicantUseCase;
  final ConsiderResumeUseCase _considerResumeUseCase;

  String? _jobID;

  late TabController tabController;

  ViewJobApplicantCubit(
    this._getListApplicantUseCase,
    this._considerResumeUseCase,
  ) : super(const ViewJobApplicantState());

  Future getListApplicant([String? jobID]) async {
    _jobID ??= jobID;
    final response = await _getListApplicantUseCase.call(params: _jobID ?? "");
    if (response is DataSuccess) {
      emit(state.copyWith(listResume: response.data));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future considerResume(ConsiderResume consider) async {
    List<ResumeApplicantEntity> listResume = [...state.listResume!];
    List<ResumeApplicantEntity> temptList = state.listResume!
        .map((e) => e.id == consider.applyID
            ? e.copyWith(isAccept: consider.isAccept)
            : e)
        .toList();
    emit(state.copyWith(listResume: temptList));
    final response = await _considerResumeUseCase.call(params: consider);
    if (response is DataFailed) {
      emit(state.copyWith(listResume: listResume, error: response.error));
    }
  }
}
