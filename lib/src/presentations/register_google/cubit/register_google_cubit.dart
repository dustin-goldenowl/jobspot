import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/register_google/domain/router/register_google_coordinator.dart';
import 'package:jobspot/src/presentations/register_google/domain/use_cases/update_info_user_use_case.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';

part 'register_google_state.dart';

@injectable
class RegisterGoogleCubit extends Cubit<RegisterGoogleState> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final UpdateInfoUserUseCase _updateInfoUserUseCase;

  RegisterGoogleCubit(this._updateInfoUserUseCase)
      : super(RegisterGoogleState.ds()) {
    final currentUser = FirebaseAuth.instance.currentUser!;
    nameController.text = currentUser.displayName!;
    emailController.text = currentUser.email!;
  }

  void changeGender(bool isMale) => emit(state.copyWith(isMale: isMale));

  void changeBirthdate(DateTime date) => emit(state.copyWith(birthday: date));

  void cancelRegisterGoogle() {
    FirebaseAuth.instance.currentUser!.delete();
    GoogleSignIn().signOut();
    RegisterGoogleCoordinator.back();
  }

  Future registerApplicantWithGoogle() async {
    emit(state.copyWith(isLoading: true));
    final response = await _updateInfoUserUseCase.call(
        params: RegisterApplicantEntity(
      fullname: nameController.text,
      email: emailController.text,
      password: "",
      gender: state.isMale,
      birthday: state.birthday,
    ));
    emit(state.copyWith(dataState: response));
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    return super.close();
  }
}
