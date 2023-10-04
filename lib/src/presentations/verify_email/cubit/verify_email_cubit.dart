import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_mail_app/open_mail_app.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  Timer? timer;
  Timer? countdown;

  VerifyEmailCubit()
      : super(const VerifyEmailState(timeResend: -1, isVerify: false)) {
    timer = Timer.periodic(
        const Duration(seconds: 3), (timer) => verifyEmailVerified());
  }

  Future sendVerifyEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      countdown = Timer.periodic(const Duration(seconds: 1), (timer) {
        emit(state.copyWith(
          timeResend: state.timeResend < 0 ? 59 : state.timeResend - 1,
        ));
        if (state.timeResend == 0) countdown?.cancel();
      });
    } catch (e) {
      print(e);
    }
  }

  Future verifyEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      timer!.cancel();
      emit(state.copyWith(isVerify: true));
    }
  }

  Future openMailApp() async => await OpenMailApp.openMailApp();

  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    if (countdown != null) {
      countdown!.cancel();
    }
  }
}
