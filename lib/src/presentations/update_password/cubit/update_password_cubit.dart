import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart';
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart';

part 'update_password_state.dart';

@injectable
class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final comfirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final ChangePasswordUseCase _changePasswordUseCase;
  final ValidatePassworkUseCase _validatePassworkUseCase;

  UpdatePasswordCubit(
    this._changePasswordUseCase,
    this._validatePassworkUseCase,
  ) : super(UpdatePasswordState.ds());

  void changeHideNewPassword(bool isHide) =>
      emit(state.copyWith(isHideNewPassword: isHide));

  void changeHideOldPassword(bool isHide) =>
      emit(state.copyWith(isHideOldPassword: isHide));

  void changeHideConfirmPassword(bool isHide) =>
      emit(state.copyWith(isHideConfirmPassword: isHide));

  Future changePassword() async {
    emit(state.copyWith(isLoading: true));
    final validate =
        await _validatePassworkUseCase.call(params: oldPasswordController.text);
    if (validate is DataSuccess) {
      if (validate.data!) {
        final response = await _changePasswordUseCase.call(
            params: newPasswordController.text);
        if (response is DataSuccess) {
          emit(state.copyWith());
        } else {
          emit(state.copyWith(error: response.error));
        }
      } else {
        emit(state.copyWith(
          error: AppLocal.text.update_password_page_old_password_incorrect,
        ));
      }
    }
  }

  @override
  Future<void> close() {
    newPasswordController.dispose();
    oldPasswordController.dispose();
    comfirmPasswordController.dispose();
    return super.close();
  }
}
