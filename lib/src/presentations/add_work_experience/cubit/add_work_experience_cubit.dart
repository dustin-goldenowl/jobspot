import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/update_work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart';
import 'package:jobspot/src/presentations/add_work_experience/widgets/bottom_sheet_work_experience.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/entities/add_work_experience_entity.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

part 'add_work_experience_state.dart';

@injectable
class AddWorkExperienceCubit extends Cubit<AddWorkExperienceState> {
  final jobTitleController = TextEditingController();
  final companyNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();

  String? _experienceID;

  final AddExperienceUseCase _addExperienceUseCase;
  final UpdateExperienceUseCase _updateExperienceUseCase;
  final DeleteExperienceUseCase _deleteExperienceUseCase;

  AddWorkExperienceCubit(
    this._addExperienceUseCase,
    this._updateExperienceUseCase,
    this._deleteExperienceUseCase,
  ) : super(AddWorkExperienceState.ds());

  void initExperience(UpdateWorkExperienceEntity? experience) {
    if (experience != null) {
      _experienceID = experience.id;
      jobTitleController.text = experience.jobTitle;
      companyNameController.text = experience.companyName;
      descriptionController.text = experience.description;
      startDateController.text =
          DateTimeUtils.formatMonthYear(experience.startDate);
      endDateController.text =
          DateTimeUtils.formatMonthYear(experience.endDate);
      emit(state.copyWith(
        startDate: experience.startDate,
        endDate: experience.endDate,
        isWorkNow: experience.isWorkNow,
      ));
    }
  }

  bool get isUpdate => _experienceID != null;

  void showNotiChangeExperience(BuildContext context, {bool isRemove = false}) {
    if (!isRemove && validate() == null || isRemove) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        builder: (context) => BottomSheetWorkExperience(
          isRemove: isRemove,
          onAccept: isRemove
              ? deleteWorkExperience
              : _experienceID == null
                  ? addWorkExperience
                  : updateWorkExperience,
        ),
      );
    } else {
      emit(state.copyWith(error: validate()));
    }
  }

  String? validate() {
    if (jobTitleController.text.isEmpty) {
      return AppLocal.text.add_work_experience_page_job_title_validate;
    }
    if (companyNameController.text.isEmpty) {
      return AppLocal.text.add_work_experience_page_company_validate;
    }
    if (startDateController.text.isEmpty) {
      return AppLocal.text.add_work_experience_page_start_date_validate;
    }
    if (!state.isWorkNow && endDateController.text.isEmpty) {
      return AppLocal.text.add_work_experience_page_end_date_validate;
    }
    return null;
  }

  void changeIsWorkNow(bool value) => emit(state.copyWith(isWorkNow: value));

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

  Future addWorkExperience() async {
    emit(state.copyWith(isLoading: true));
    final response = await _addExperienceUseCase.call(
        params: AddWorkExperienceEntity(
      jobTitle: jobTitleController.text,
      companyName: companyNameController.text,
      description: descriptionController.text,
      startDate: state.startDate,
      endDate: state.endDate,
      isWorkNow: state.isWorkNow,
    ));
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future updateWorkExperience() async {
    emit(state.copyWith(isLoading: true));
    final response = await _updateExperienceUseCase.call(
        params: UpdateWorkExperienceEntity(
      id: _experienceID!,
      jobTitle: jobTitleController.text,
      companyName: companyNameController.text,
      description: descriptionController.text,
      startDate: state.startDate,
      endDate: state.endDate,
      isWorkNow: state.isWorkNow,
    ));
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future deleteWorkExperience() async {
    emit(state.copyWith(isLoading: true));
    final response =
        await _deleteExperienceUseCase.call(params: _experienceID!);
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }
}
