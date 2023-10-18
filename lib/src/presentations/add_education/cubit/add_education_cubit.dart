import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/add_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/domain/entities/update_education_entity.dart';
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart';
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart';
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart';
import 'package:jobspot/src/presentations/add_education/widgets/bottom_sheet_education.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

part 'add_education_state.dart';

@injectable
class AddEducationCubit extends Cubit<AddEducationState> {
  final levelEducationController = TextEditingController();
  final institutionNameController = TextEditingController();
  final fieldStudyController = TextEditingController();
  final descriptionController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? _educationID;

  final AddEducationUseCase _addEducationUseCase;
  final UpdateEducationUseCase _updateEducationUseCase;
  final DeleteEducationUseCase _deleteEducationUseCase;

  AddEducationCubit(
    this._addEducationUseCase,
    this._deleteEducationUseCase,
    this._updateEducationUseCase,
  ) : super(AddEducationState.ds());

  void initEducation(UpdateEducationEntity? education) {
    if (education != null) {
      _educationID = education.id;
      levelEducationController.text = education.levelEdu;
      institutionNameController.text = education.institutionName;
      fieldStudyController.text = education.fieldStudy;
      descriptionController.text = education.description;
      startDateController.text =
          DateTimeUtils.formatMonthYear(education.startDate);
      endDateController.text = DateTimeUtils.formatMonthYear(education.endDate);
      emit(state.copyWith(
        startDate: education.startDate,
        endDate: education.endDate,
        isEduNow: education.isEduNow,
      ));
    }
  }

  void changeIsEduNow(bool value) => emit(state.copyWith(isEduNow: value));

  bool get isUpdate => _educationID != null;

  void showNotiChangeExperience(BuildContext context, {bool isRemove = false}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => BottomSheetEducation(
        isRemove: isRemove,
        onAccept: isRemove
            ? deleteWorkExperience
            : _educationID == null
                ? addWorkExperience
                : updateWorkExperience,
      ),
    );
  }

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
    final response = await _addEducationUseCase.call(
        params: AddEducationEntity(
      levelEdu: levelEducationController.text,
      institutionName: institutionNameController.text,
      fieldStudy: fieldStudyController.text,
      description: descriptionController.text,
      startDate: state.startDate,
      endDate: state.endDate,
      isEduNow: state.isEduNow,
    ));
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future updateWorkExperience() async {
    emit(state.copyWith(isLoading: true));
    final response = await _updateEducationUseCase.call(
        params: UpdateEducationEntity(
      id: _educationID!,
      levelEdu: levelEducationController.text,
      institutionName: institutionNameController.text,
      fieldStudy: fieldStudyController.text,
      description: descriptionController.text,
      startDate: state.startDate,
      endDate: state.endDate,
      isEduNow: state.isEduNow,
    ));
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future deleteWorkExperience() async {
    emit(state.copyWith(isLoading: true));
    final response = await _deleteEducationUseCase.call(params: _educationID!);
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  @override
  Future<void> close() {
    levelEducationController.dispose();
    institutionNameController.dispose();
    fieldStudyController.dispose();
    descriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    return super.close();
  }
}
