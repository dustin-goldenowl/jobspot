import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/apply_job_entity.dart';
import 'package:jobspot/src/presentations/apply_job/widgets/list_resume_bottom_sheet.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';
import 'package:jobspot/src/core/common/custom_toast.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart';

part 'apply_job_state.dart';

@injectable
class ApplyJobCubit extends Cubit<ApplyJobState> {
  final ScrollController scrollController = ScrollController();

  TextEditingController controller = TextEditingController();

  final ApplyJobUseCase _applyJobUseCase;
  final GetResumeUseCase _getResumeUseCase;

  ApplyJobCubit(
    this._applyJobUseCase,
    this._getResumeUseCase,
  ) : super(const ApplyJobState(isTop: false)) {
    scrollController.addListener(() {
      bool isTop = scrollController.position.pixels >=
          240 - 2 * AppBar().preferredSize.height;
      changeIsTop(isTop);
    });
  }

  void changeIsTop(bool isTop) =>
      emit(state.copyWith(isTop: isTop, resume: state.resume));

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
        final resume = ResumeEntity(
          id: "",
          fileName: result.files.single.name,
          filePath: result.files.single.path ?? "",
          size: result.files.single.size,
          createAt: DateTime.now(),
        );
        emit(state.copyWith(resume: resume));
      }
    }
  }

  void removeCV() => emit(state.copyWith());

  void showPickResume(BuildContext context) async {
    final resume = await showSlidingBottomSheet<ResumeEntity>(
      context,
      builder: (context) {
        return SlidingSheetDialog(
          elevation: 8,
          cornerRadius: 16,
          avoidStatusBar: true,
          snapSpec: const SnapSpec(
            snap: true,
            initialSnap: 0.4,
            snappings: [0.4, 0.7, 0.95],
            positioning: SnapPositioning.relativeToSheetHeight,
          ),
          scrollSpec: const ScrollSpec.bouncingScroll(),
          headerBuilder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 25),
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.nightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            );
          },
          builder: (context, state) => FutureBuilder(
            future: _getResumeUseCase.call(
                params: FirebaseAuth.instance.currentUser!.uid),
            builder: (context, snapshot) {
              List<ResumeEntity>? listResume;
              if (snapshot.hasData && snapshot.data is DataSuccess) {
                listResume = snapshot.data?.data;
              }
              return ListResumeBottomSheet(
                listResume: listResume,
                onTap: Navigator.of(context).pop,
                pickPDF: () {
                  Navigator.of(context).pop();
                  pickCVFile(context);
                },
              );
            },
          ),
        );
      },
    );
    if (resume != null) {
      emit(state.copyWith(resume: resume));
    }
  }

  Future applyJob({required String jobID, required String uidJob}) async {
    emit(state.copyWith(resume: state.resume, isLoading: true));
    final response = await _applyJobUseCase.call(
        params: ApplyJobEntity(
      uidJob: uidJob,
      description: controller.text,
      jobID: jobID,
      resume: state.resume!,
    ));
    emit(state.copyWith(resume: state.resume, dataState: response));
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    controller.dispose();
    return super.close();
  }
}
