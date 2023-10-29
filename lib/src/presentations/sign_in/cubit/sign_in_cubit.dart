import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_messaging_service.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/presentations/notification/domain/use_cases/update_token_use_case.dart';
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
  final UpdateTokenUseCase _updateTokenUseCase;

  SignInCubit(
    this._signInEmailPasswordUseCase,
    this._signInGoogleUseCase,
    this._updateTokenUseCase,
  ) : super(SignInState(isHide: true, isRememberMe: PrefsUtils.isRemember)) {
    if (PrefsUtils.isRemember) {
      emailController.text = PrefsUtils.email!;
      passwordController.text = PrefsUtils.password!;
    }
  }

  void hidePassword(bool isHide) => emit(state.copyWith(isHide: isHide));

  void rememberMe(bool isRememberMe) =>
      emit(state.copyWith(isRememberMe: isRememberMe));

  Future signInWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(isLoading: true));
      final response = await _signInEmailPasswordUseCase.call(
          params: AuthenticationEntity(
        email: emailController.text,
        password: passwordController.text,
      ));
      emit(state.copyWith(dataState: response, isLoginGoogle: false));
      if (response is DataSuccess) {
        if (state.isRememberMe) {
          PrefsUtils.setRemember(
            email: emailController.text,
            password: passwordController.text,
          );
        } else {
          PrefsUtils.removeRemember();
        }
      }
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      emit(state.copyWith(isLoading: true));
      final response = await _signInGoogleUseCase.call(params: googleUser);
      emit(state.copyWith(dataState: response, isLoginGoogle: true));
    } else {
      emit(state.copyWith(
        dataState: DataFailed(AppLocal.text.cancel_google_login),
      ));
    }
  }

  Future updateToken() async {
    final token = await FirebaseMessagingService.getToken();
    _updateTokenUseCase.call(params: token ?? "");
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
