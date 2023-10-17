import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_work_experience/widgets/bottom_sheet_work_experience.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/work_experience_entity.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

part 'add_work_experience_state.dart';

class AddWorkExperienceCubit extends Cubit<AddWorkExperienceState> {
  final jobTitleController = TextEditingController();
  final companyNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  final Function(WorkExperienceEntity experience) onSave;
  final VoidCallback? onRemove;

  AddWorkExperienceCubit({required this.onSave, required this.onRemove})
      : super(AddWorkExperienceState.ds());

  void showNotiChangeExperience(BuildContext context, {bool isRemove = false}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => BottomSheetWorkExperience(
        isRemove: isRemove,
        onAccept: () {},
        onCancel: () {},
      ),
    );
  }

  void changeIsWorkNow(bool value) => emit(state.copyWith(isWorkNow: value));

  void saveExperience() => onSave(WorkExperienceEntity(
        jobTitle: jobTitleController.text,
        companyName: companyNameController.text,
        description: descriptionController.text,
        startDate: state.startDate,
        endDate: state.endDate,
        isWorkNow: state.isWorkNow,
      ));

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
        startDateController.text = DateTimeUtils.formatMonthYear(picked);
        emit(state.copyWith(
          startDate: picked,
          endDate: picked.isAfter(state.endDate) ? picked : null,
        ));
      } else {
        endDateController.text = DateTimeUtils.formatMonthYear(picked);
        emit(state.copyWith(endDate: picked));
      }
    }
  }
}
