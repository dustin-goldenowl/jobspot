import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/authentication_entity.dart';
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_email_password_use_case.dart';
import 'package:jobspot/src/presentations/sign_in/domain/use_cases/sign_in_google_use_case.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DateTime? currentBackPressTime;
  final formKey = GlobalKey<FormState>();

  final SignInEmailPasswordUseCase _signInEmailPasswordUseCase;
  final SignInGoogleUseCase _signInGoogleUseCase;

  SignInCubit(
    this._signInEmailPasswordUseCase,
    this._signInGoogleUseCase,
  ) : super(SignInState(isHide: true, isRememberMe: PrefsUtils.isRemember)) {
    if (PrefsUtils.isRemember) {
      emailController.text = PrefsUtils.email!;
      passwordController.text = PrefsUtils.password!;
    }
  }

  void hidePassword(bool isHide) => emit(state.copyWith(isHide: isHide));

  void rememberMe(bool isRememberMe) =>
      emit(state.copyWith(isRememberMe: isRememberMe));

  void validateEmailPassword() async {
    if (formKey.currentState!.validate()) {
      signInWithEmailAndPassword();
    }
  }

  Future signInWithEmailAndPassword() async {
    emit(state.copyWith(isLoading: true));
    final response = await _signInEmailPasswordUseCase.call(
        params: AuthenticationEntity(
      email: emailController.text,
      password: passwordController.text,
    ));
    emit(state.copyWith(dataState: response, isRegisterGoogle: false));
    if (response is DataSuccess) {
      rememberUser();
    }
  }

  Future rememberUser() async {
    if (state.isRememberMe) {
      PrefsUtils.setRemember(
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      PrefsUtils.removeRemember();
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      emit(state.copyWith(isLoading: true));
      final response = await _signInGoogleUseCase.call(params: googleUser);
      emit(state.copyWith(
        dataState: response,
        isRegisterGoogle: !(response.data ?? false),
      ));
    } else {
      emit(state.copyWith(
        dataState: DataFailed(AppLocal.text.cancel_google_login),
      ));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
