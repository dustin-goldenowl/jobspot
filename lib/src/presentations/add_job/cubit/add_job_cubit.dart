import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_job_type_view.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_type_workplace_view.dart';

part 'add_job_state.dart';

class AddJobCubit extends Cubit<AddJobState> {
  AddJobCubit()
      : super(const AddJobState(
          jobType: -1,
          typeWorkplace: -1,
          jobPosition: "",
          jobLocation: -1,
          description: "",
        ));

  void changeJobType(int index) => emit(state.copyWith(jobType: index));

  void changeTypeWorkplace(int index) =>
      emit(state.copyWith(typeWorkplace: index));

  void changeJobPosition(String jobTitle) =>
      emit(state.copyWith(jobPosition: jobTitle));

  void changeJobLocation(int code) => emit(state.copyWith(jobLocation: code));

  void changeJobDescription(String description) {
    print(description);
    emit(state.copyWith(description: description));
  }

  void showBottomSheetTypeWorkplace(
    BuildContext context, {
    required int groupValue,
    required Function(int? value) onChange,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return BottomSheetTypeWorkplaceView(
          groupValue: groupValue,
          onChange: onChange,
        );
      },
    );
  }

  void showBottomSheetJobType(
    BuildContext context, {
    required int groupValue,
    required Function(int? value) onChange,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetJobTypeView(
          groupValue: groupValue,
          onChange: onChange,
        );
      },
    );
  }
}
