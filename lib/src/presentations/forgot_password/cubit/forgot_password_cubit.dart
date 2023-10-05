import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobspot/src/core/resources/data_state.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgotPasswordCubit() : super(const ForgotPasswordState());

  Future sendForgotPassword() async {
    emit(state.copyWith(isLoading: true));
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text)
        .then((value) => emit(state.copyWith(dataState: DataSuccess(true))))
        .catchError(
            (e) => emit(state.copyWith(dataState: DataFailed(e.toString()))));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
