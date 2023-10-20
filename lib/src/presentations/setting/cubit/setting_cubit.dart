import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/src/presentations/setting/domain/router/setting_coordinator.dart';
import 'package:jobspot/src/presentations/setting/widgets/bottom_sheet_language.dart';
import 'package:jobspot/src/presentations/setting/widgets/bottom_sheet_log_out.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit()
      : super(const SettingState(isNotification: true, isVietNam: true));

  void changeNotification(bool value) =>
      emit(state.copyWith(isNotification: value));

  void changeLanguage(bool value) => emit(state.copyWith(isVietNam: value));

  void logOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    SettingCoordinator.logOut();
  }

  void showBottomSheetLogOut(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => BottomSheetLogOut(onAccept: logOut),
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
