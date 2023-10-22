import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/setting/domain/router/setting_coordinator.dart';
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart';
import 'package:jobspot/src/presentations/setting/widgets/bottom_sheet_language.dart';
import 'package:jobspot/src/presentations/setting/widgets/bottom_sheet_setting.dart';

part 'setting_state.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  final DeleteAccountUseCase _useCase;

  SettingCubit(this._useCase) : super(SettingState.ds());

  void changeNotification(bool value) =>
      emit(state.copyWith(isNotification: value));

  void changeLanguage(bool value) => emit(state.copyWith(isVietNam: value));

  void logOut() {
    PrefsUtils.removeUserInfo();
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    SettingCoordinator.logOut();
  }

  Future deleteAccount() async {
    emit(state.copyWith(isLoading: true));
    final response = await _useCase.call();
    if (response is DataSuccess) {
      emit(state.copyWith());
      logOut();
    } else {
      emit(state.copyWith(error: response.error));
    }
  }

  void showBottomSheetLogOut(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => BottomSheetSetting(
        title: AppLocal.text.setting_page_log_out,
        content: AppLocal.text.setting_page_log_out_content,
        onAccept: logOut,
      ),
    );
  }

  void showBottomSheetDeleteAccount(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => BottomSheetSetting(
        title: AppLocal.text.setting_page_delete_account,
        content: AppLocal.text.setting_page_delete_account_content,
        onAccept: deleteAccount,
      ),
    );
  }

  void showBottomLanguage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => BottomSheetLanguage(
        isVietnamese: state.isVietNam,
        onAccept: (value) => emit(state.copyWith(isVietNam: value)),
      ),
    );
  }
}
