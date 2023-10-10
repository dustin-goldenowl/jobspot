import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_job_type_view.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_level.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_salary.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_type_workplace_view.dart';

part 'add_job_state.dart';

@injectable
class AddJobCubit extends Cubit<AddJobState> {
  final AddJobUseCase _addJobUseCase;

  AddJobCubit(this._addJobUseCase) : super(AddJobState.ds());

  Future addJob() async {
    emit(state.copyWith(isLoading: true));
    final response = await _addJobUseCase.call(params: state.getJobEntity);
    emit(state.copyWith(dataState: response));
  }

  void changeJobPosition(String jobTitle) =>
      emit(state.copyWith(jobPosition: jobTitle));

  void changeJobLocation(int code) => emit(state.copyWith(jobLocation: code));

  void changeJobDescription(String description) =>
      emit(state.copyWith(description: description));

  Future selectDate(BuildContext context, {bool isStartDate = true}) async {
    DateTime selectedDate = isStartDate ? state.startDate : state.endDate;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: isStartDate ? DateTime.now() : state.startDate,
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      if (isStartDate) {
        emit(state.copyWith(
          startDate: picked,
          endDate: picked.isAfter(state.endDate) ? picked : null,
        ));
      } else {
        emit(state.copyWith(endDate: picked));
      }
    }
  }

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
            emit(state.copyWith(typeWorkplace: value));
          },
        );
      },
    );
  }

  void showBottomSheetSalary(BuildContext context) {
    TextEditingController controller = TextEditingController(
        text: state.salary != -1 ? state.salary.toString() : "");
    final formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetSalary(
          formKey: formKey,
          controller: controller,
          onChange: (value) {
            context.router.pop();
            emit(state.copyWith(salary: value));
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
            emit(state.copyWith(level: value));
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
            emit(state.copyWith(jobType: value));
          },
        );
      },
    );
  }
}
