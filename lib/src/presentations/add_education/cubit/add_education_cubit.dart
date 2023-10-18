import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

part 'add_education_state.dart';

class AddEducationCubit extends Cubit<AddEducationState> {
  final levelEducationController = TextEditingController();
  final institutionNameController = TextEditingController();
  final fieldStudyController = TextEditingController();
  final descriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  AddEducationCubit() : super(AddEducationState.ds());

  void changeIsEduNow(bool value) => emit(state.copyWith(isEduNow: value));

  Future selectDate(BuildContext context, {bool isStartDate = true}) async {
    DateTime selectedDate = isStartDate ? state.startDate : state.endDate;
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: selectedDate,
      firstDate: isStartDate ? DateTime(1900) : state.startDate,
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      if (isStartDate) {
        // startDateController.text = DateTimeUtils.formatMonthYear(picked);
        emit(state.copyWith(
          startDate: picked,
          endDate: picked.isAfter(state.endDate) ? picked : null,
        ));
      } else {
        // endDateController.text = DateTimeUtils.formatMonthYear(picked);
        emit(state.copyWith(endDate: picked));
      }
    }
  }
}
