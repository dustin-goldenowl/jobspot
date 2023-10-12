import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/cv_entity.dart';
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart';

part 'apply_job_state.dart';

@injectable
class ApplyJobCubit extends Cubit<ApplyJobState> {
  final ApplyJobUseCase _useCase;

  TextEditingController controller = TextEditingController();

  ApplyJobCubit(this._useCase) : super(const ApplyJobState());

  Future pickCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      dialogTitle: "Please select an your CV",
    );
    if (result != null) {
      emit(state.copyWith(file: result.files.single, time: DateTime.now()));
    }
  }

  void removeCV() => emit(state.copyWith());

  Future applyJob(String jobID) async {
    emit(state.copyWith(file: state.file, time: state.time, isLoading: true));
    final response = await _useCase.call(
        params: CVEntity(
      fileName: state.file!.name,
      path: state.file!.path!,
      description: controller.text,
      jobID: jobID,
      size: state.file!.size,
    ));
    emit(state.copyWith(
        file: state.file, time: state.time, dataState: response));
  }
}
