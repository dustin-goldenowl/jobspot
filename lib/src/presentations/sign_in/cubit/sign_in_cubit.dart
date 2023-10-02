import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/email_password_entity.dart';
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart';
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInEmailPasswordUseCase _signInEmailPasswordUseCase;
  final SignInGoogleUseCase _signInGoogleUseCase;

  SignInCubit(this._signInEmailPasswordUseCase, this._signInGoogleUseCase)
      : super(SignInInitial());

  void hidePassword(bool isHide) {
    emit(HidePasswordState(isHide));
  }

  void rememberMe(bool isRememberMe) {
    emit(RememberMeState(isRememberMe));
  }

  Future signInWithEmailAndPassword(EmailPasswordEntity entity) async {
    emit(SignInLoadingState());
    final response = await _signInEmailPasswordUseCase.call(params: entity);
    if (response is DataSuccess && response.data != null) {
      emit(SignInSuccessState(response.data!));
    } else {
      emit(SignInErrorState(response.error ?? ""));
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      emit(SignInLoadingState());
      final response = await _signInGoogleUseCase.call(params: googleUser);
      if (response is DataSuccess && response.data != null) {
        emit(SignInSuccessState(response.data!));
      } else {
        emit(SignInErrorState(response.error ?? ""));
      }
    } else {
      emit(SignInErrorState(AppLocal.text.cancel_google_login));
    }
  }
}
