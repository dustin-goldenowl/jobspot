import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart';
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart';
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart';
import 'package:jobspot/src/presentations/save_job/widgets/bottom_sheet_save_job_option_view.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

part 'save_job_state.dart';

@injectable
class SaveJobCubit extends Cubit<SaveJobState> {
  final ListenSaveJobUseCase _listenSaveJobUseCase;
  final DeleteAllSaveJobUseCase _deleteAllSaveJobUseCase;
  final SaveJobUseCase _saveJobUseCase;

  StreamSubscription? _subscription;

  SaveJobCubit(
    this._listenSaveJobUseCase,
    this._deleteAllSaveJobUseCase,
    this._saveJobUseCase,
  ) : super(const SaveJobState());

  void listenSaveJob() {
    if (_subscription != null) _subscription!.cancel();
    _subscription = _listenSaveJobUseCase.call().listen((event) {
      if (event is DataSuccess) {
        emit(state.copyWith(listJob: event.data));
      } else {
        emit(state.copyWith(error: event.error));
      }
    });
  }

  Future deleteAllSaveJob() async {
    final response = await _deleteAllSaveJobUseCase.call();
    if (response is DataSuccess) {
      emit(state.copyWith(isDeleteAllSaveJob: true));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future deleteSaveJob(String jobID) async {
    final response = await _saveJobUseCase.call(params: jobID);
    if (response is DataSuccess) {
      emit(state.copyWith(deleteJobID: jobID));
    }
  }

  void showBottomSheetOption(BuildContext context, {required JobEntity job}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) => BottomSheetSaveJobOptionView(
        job: job,
        onDelete: deleteSaveJob,
      ),
    );
  }

  @override
  Future<void> close() {
    if (_subscription != null) _subscription!.cancel();
    return super.close();
  }
}
