import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_messaging_service.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart';
import 'package:jobspot/src/presentations/setting/domain/use_cases/delete_account_use_case.dart';
import 'package:jobspot/src/presentations/setting/widgets/bottom_sheet_language.dart';
import 'package:jobspot/src/presentations/setting/widgets/bottom_sheet_setting.dart';

part 'setting_state.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  final DeleteAccountUseCase _deleteAccountUseCase;
  final UpdateTokenUseCase _updateTokenUseCase;

  SettingCubit(this._deleteAccountUseCase, this._updateTokenUseCase)
      : super(SettingState.ds());

  Future changeNotification(bool value) async {
    PrefsUtils.setIsNotification(value);
    emit(state.copyWith(isNotification: value));
    String token = "";
    if (value) {
      token = (await FirebaseMessagingService.getToken()) ?? "";
    }
    await _updateTokenUseCase.call(params: token);
  }

  void changeLanguage(bool value) => emit(state.copyWith(isVietNam: value));

  Future logOut() async {
    emit(state.copyWith(isLoading: true));
    await Future.wait([
      _updateTokenUseCase.call(params: ""),
      PrefsUtils.removeUserInfo(),
      PrefsUtils.removeNotification(),
    ]);
    await Future.wait([
      FirebaseAuth.instance.signOut(),
      GoogleSignIn().signOut(),
    ]);
    emit(state.copyWith(isLogout: true));
  }

  Future deleteAccount() async {
    emit(state.copyWith(isLoading: true));
    final response = await _deleteAccountUseCase.call();
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
        onAccept: () {
          Navigator.of(context).pop();
          logOut();
        },
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
