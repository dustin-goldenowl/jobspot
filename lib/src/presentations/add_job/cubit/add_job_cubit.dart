import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/add_job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/use_cases/add_job_use_case.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/presentations/add_job/domain/use_cases/update_job_use_case.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_job_type_view.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_level.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_salary.dart';
import 'package:jobspot/src/presentations/add_job/widgets/bottom_sheet_type_workplace_view.dart';

part 'add_job_state.dart';

@injectable
class AddJobCubit extends Cubit<AddJobState> {
  final AddJobUseCase _addJobUseCase;
  final UpdateJobUseCase _updateJobUseCase;

  String? _jobID;
  bool _isUpdate = false;

  bool get isUpdate => _isUpdate;

  AddJobCubit(this._addJobUseCase, this._updateJobUseCase)
      : super(AddJobState.ds());

  void initUpdateJob(UpdateJobEntity? job) {
    if (job != null) {
      _jobID = job.id;
      _isUpdate = true;
      emit(AddJobState.fromUpdateJobEntity(job));
    }
  }

  Future addJob() async {
    if (_validate() == null) {
      emit(state.copyWith(isLoading: true));
      final response = await _addJobUseCase.call(params: state.getAddJobEntity);
      emit(state.copyWith(dataState: response));
    } else {
      emit(state.copyWith(dataState: DataFailed(_validate()!)));
    }
  }

  Future updateJob() async {
    if (_validate() == null) {
      emit(state.copyWith(isLoading: true));
      final response = await _updateJobUseCase.call(
          params: state.getUpdateJobEntity(_jobID!));
      emit(state.copyWith(dataState: response));
    } else {
      emit(state.copyWith(dataState: DataFailed(_validate()!)));
    }
  }

  String? _validate() {
    if (state.jobPosition.isEmpty) {
      return AppLocal.text.add_job_page_please_enter_job_position;
    }
    if (state.level == -1) {
      return AppLocal.text.add_job_page_please_select_employee_level;
    }
    if (state.typeWorkplace == -1) {
      return AppLocal.text.add_job_page_please_select_type_workplace;
    }
    if (state.jobLocation == -1) {
      return AppLocal.text.add_job_page_please_select_work_location;
    }
    if (state.jobType == -1) {
      return AppLocal.text.add_job_page_please_select_job_type;
    }
    if (state.description.isEmpty) {
      return AppLocal.text.add_job_page_please_enter_job_description;
    }
    if (state.salary == -1) {
      return AppLocal.text.add_job_page_please_enter_salary;
    }
    return null;
  }

  void changeJobPosition(String jobTitle) =>
      emit(state.copyWith(jobPosition: jobTitle));

  void changeJobLocation(int code) => emit(state.copyWith(jobLocation: code));

  void changeJobDescription(String description) =>
      emit(state.copyWith(description: description));

  void addJobRequirement(String requirement) =>
      emit(state.copyWith(requirements: [...state.requirements, requirement]));

  void editJobRequirement({required String requirement, required int index}) {
    List<String> requirements = [...state.requirements];
    requirements[index] = requirement;
    emit(state.copyWith(requirements: requirements));
  }

  void removeJobRequirement(int index) {
    List<String> requirements = [...state.requirements];
    requirements.removeAt(index);
    emit(state.copyWith(requirements: requirements));
  }

  Future selectDate(BuildContext context, {bool isStartDate = true}) async {
    DateTime selectedDate = isStartDate ? state.startDate : state.endDate;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: isStartDate ? DateTime.now().getDate : state.startDate,
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

  void customBottomSheet(BuildContext context, {required Widget child}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) => child,
    );
  }

  void showBottomSheetTypeWorkplace(
    BuildContext context, {
    required int groupValue,
  }) {
    customBottomSheet(
      context,
      child: BottomSheetTypeWorkplaceView(
        groupValue: groupValue,
        onChange: (value) {
          context.router.pop();
          emit(state.copyWith(typeWorkplace: value));
        },
      ),
    );
  }

  void showBottomSheetSalary(BuildContext context) {
    TextEditingController controller = TextEditingController(
        text: state.salary != -1 ? state.salary.toString() : "");
    final formKey = GlobalKey<FormState>();
    customBottomSheet(
      context,
      child: BottomSheetSalary(
        formKey: formKey,
        controller: controller,
        onChange: (value) {
          context.router.pop();
          emit(state.copyWith(salary: value));
        },
      ),
    );
  }

  void showBottomSheetLevel(BuildContext context, {required int groupValue}) {
    customBottomSheet(
      context,
      child: BottomSheetLevel(
        groupValue: groupValue,
        onChange: (value) {
          context.router.pop();
          emit(state.copyWith(level: value));
        },
      ),
    );
  }

  void showBottomSheetJobType(BuildContext context, {required int groupValue}) {
    customBottomSheet(
      context,
      child: BottomSheetJobTypeView(
        groupValue: groupValue,
        onChange: (value) {
          context.router.pop();
          emit(state.copyWith(jobType: value));
        },
      ),
    );
  }
}
