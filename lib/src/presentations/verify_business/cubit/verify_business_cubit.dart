import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/verify_business/domain/entities/verify_business_entity.dart';
import 'package:jobspot/src/presentations/verify_business/domain/use_cases/upload_file_verify_business_use_case.dart';

part 'verify_business_state.dart';

@injectable
class VerifyBusinessCubit extends Cubit<VerifyBusinessState> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final UploadFileVerifyBusinessUseCase _uploadFileVerifyBusinessUseCase;

  VerifyBusinessCubit(this._uploadFileVerifyBusinessUseCase)
      : super(const VerifyBusinessState(isLoading: false));

  Future pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      dialogTitle: "Chọn file PDF xác thực doanh nghiệp",
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

  void removeFile() => emit(state.copyWith());

  Future uploadFile() async {
    emit(state.copyWith(file: state.file, time: state.time, isLoading: true));
    final response = await _uploadFileVerifyBusinessUseCase.call(
        params: VerifyBusinessEntity(
      description: controller.text,
      file: state.file ?? PlatformFile(name: "", size: 0),
    ));
    if (response is DataFailed) {
      emit(state.copyWith(
        error: response.error,
        file: state.file,
        time: state.time,
      ));
    } else {
      emit(state.copyWith());
    }
  }

  void validateInfo() {
    if (formKey.currentState!.validate() && state.file != null) {
      uploadFile();
    } else if (state.file == null) {
      emit(state.copyWith(
        error: "Vui lòng chọn tệp để xác thực",
        file: state.file,
        time: state.time,
      ));
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
