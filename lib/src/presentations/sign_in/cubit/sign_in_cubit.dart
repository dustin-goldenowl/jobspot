import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/authentication_entity.dart';
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart';
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInEmailPasswordUseCase _signInEmailPasswordUseCase;
  final SignInGoogleUseCase _signInGoogleUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DateTime? currentBackPressTime;
  final formKey = GlobalKey<FormState>();

  SignInCubit(this._signInEmailPasswordUseCase, this._signInGoogleUseCase)
      : super(const SignInState(isHide: true, isRememberMe: false));

  void hidePassword(bool isHide) => emit(state.copyWith(isHide: isHide));

  void rememberMe(bool isRememberMe) =>
      emit(state.copyWith(isRememberMe: isRememberMe));

  Future signInWithEmailAndPassword(AuthenticationEntity entity) async {
    emit(state.loading());
    final response = await _signInEmailPasswordUseCase.call(params: entity);
    if (response is DataSuccess && response.data != null) {
      emit(state.success(response.data!));
    } else {
      emit(state.failed(response.error ?? ""));
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      emit(state.loading());
      final response = await _signInGoogleUseCase.call(params: googleUser);
      if (response is DataSuccess && response.data != null) {
        emit(state.success(response.data!));
      } else {
        emit(state.failed(response.error ?? ""));
      }
    } else {
      emit(state.failed(AppLocal.text.cancel_google_login));
    }
  }
}
