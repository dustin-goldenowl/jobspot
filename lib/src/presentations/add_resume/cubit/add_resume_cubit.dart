import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';
import 'package:jobspot/src/presentations/add_resume/domain/use_cases/add_resume_use_case.dart';

part 'add_resume_state.dart';

@injectable
class AddResumeCubit extends Cubit<AddResumeState> {
  final AddResumeUseCase _useCase;

  AddResumeCubit(this._useCase) : super(AddResumeState.ds());

  Future pickCVFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      dialogTitle: AppLocal.text.apply_job_page_select_cv,
    );
    if (result != null) {
      if (result.files.single.size > 3000000 && context.mounted) {
        customToast(context,
            text: AppLocal.text.apply_job_page_file_size_larger);
      } else {
        emit(state.copyWith(file: result.files.single, time: DateTime.now()));
      }
    }
  }

  void removeCV() => emit(AddResumeState.ds());

  Future addResume() async {
    if (state.file != null) {
      emit(state.copyWith(isLoading: true));
      final response = await _useCase.call(
          params: AddResumeEntity(
        fileName: state.file!.name,
        path: state.file!.path!,
        size: state.file!.size,
      ));
      emit(state.copyWith(dataState: response));
    } else {
      emit(state.copyWith(dataState: DataFailed("Vui lòng chọn file")));
    }
  }
}
