import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_job_type_view.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_level.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_type_workplace_view.dart';

part 'add_job_state.dart';

class AddJobCubit extends Cubit<AddJobState> {
  AddJobCubit() : super(AddJobState.ds());

  void changeJobType(int index) => emit(state.copyWith(jobType: index));

  void changeTypeWorkplace(int index) =>
      emit(state.copyWith(typeWorkplace: index));

  void changeJobPosition(String jobTitle) =>
      emit(state.copyWith(jobPosition: jobTitle));

  void changeJobLocation(int code) => emit(state.copyWith(jobLocation: code));

  void changeJobDescription(String description) =>
      emit(state.copyWith(description: description));

  void changeLevel(int level) => emit(state.copyWith(level: level));

  void showBottomSheetTypeWorkplace(
    BuildContext context, {
    required int groupValue,
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
          onChange: (value) {
            context.router.pop();
            changeTypeWorkplace(value!);
          },
        );
      },
    );
  }

  void showBottomSheetLevel(BuildContext context, {required int groupValue}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return BottomSheetLevel(
          groupValue: groupValue,
          onChange: (value) {
            context.router.pop();
            changeLevel(value!);
          },
        );
      },
    );
  }

  void showBottomSheetJobType(BuildContext context, {required int groupValue}) {
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
          onChange: (value) {
            context.router.pop();
            changeJobType(value!);
          },
        );
      },
    );
  }
}
