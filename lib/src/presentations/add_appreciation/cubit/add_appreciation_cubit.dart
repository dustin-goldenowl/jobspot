import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/date_time_utils.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/add_appreciation_entity.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/update_appreciation_entity.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/widgets/bottom_sheet_appreciation.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

part 'add_appreciation_state.dart';

@injectable
class AddAppreciationCubit extends Cubit<AddAppreciationState> {
  final awardNameController = TextEditingController();
  final achievementController = TextEditingController();
  final descriptionController = TextEditingController();
  final endDateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? _appreciationID;

  final AddAppreciationUseCase _addAppreciationUseCase;
  final UpdateAppreciationUseCase _updateAppreciationUseCase;
  final DeleteAppreciationUseCase _deleteAppreciationUseCase;

  AddAppreciationCubit(
    this._addAppreciationUseCase,
    this._updateAppreciationUseCase,
    this._deleteAppreciationUseCase,
  ) : super(AddAppreciationState.ds());

  void initAppreciation(UpdateAppreciationEntity? appreciation) {
    if (appreciation != null) {
      _appreciationID = appreciation.id;
      awardNameController.text = appreciation.awardName;
      achievementController.text = appreciation.achievement;
      descriptionController.text = appreciation.description;
      endDateController.text =
          DateTimeUtils.formatMonthYear(appreciation.endDate);
      emit(state.copyWith(endDate: appreciation.endDate));
    }
  }

  bool get isUpdate => _appreciationID != null;

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: state.endDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != state.endDate) {
      endDateController.text = DateTimeUtils.formatMonthYear(picked);
      emit(state.copyWith(endDate: picked));
    }
  }

  void showNotiChangeAppreciation(
    BuildContext context, {
    bool isRemove = false,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => BottomSheetAppreciation(
        isRemove: isRemove,
        onAccept: isRemove
            ? deleteAppreciation
            : _appreciationID == null
                ? addAppreciation
                : updateAppreciation,
      ),
    );
  }

  Future addAppreciation() async {
    emit(state.copyWith(isLoading: true));
    final response = await _addAppreciationUseCase.call(
        params: AddAppreciationEntity(
      awardName: awardNameController.text,
      achievement: achievementController.text,
      description: descriptionController.text,
      endDate: state.endDate,
    ));
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future updateAppreciation() async {
    emit(state.copyWith(isLoading: true));
    final response = await _updateAppreciationUseCase.call(
        params: UpdateAppreciationEntity(
      id: _appreciationID!,
      awardName: awardNameController.text,
      achievement: achievementController.text,
      description: descriptionController.text,
      endDate: state.endDate,
    ));
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  Future deleteAppreciation() async {
    emit(state.copyWith(isLoading: true));
    final response =
        await _deleteAppreciationUseCase.call(params: _appreciationID!);
    if (response is DataSuccess) {
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  @override
  Future<void> close() {
    awardNameController.dispose();
    achievementController.dispose();
    descriptionController.dispose();
    endDateController.dispose();
    return super.close();
  }
}
