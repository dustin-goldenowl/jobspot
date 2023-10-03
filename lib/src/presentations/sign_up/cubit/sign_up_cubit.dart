import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_bussiness_entity.dart';
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart';
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_bussiness_use_case.dart';
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  //use case
  final RegisterApplicantUseCase _applicantUseCase;
  final RegisterBussinessUseCase _bussinessUseCase;
  final RegisterGoogleUseCase _googleUseCase;

  //applicant
  final formKeyApplicant = GlobalKey<FormState>();
  final TextEditingController nameApplicantController = TextEditingController();
  final TextEditingController emailApplicantController =
      TextEditingController();
  final TextEditingController passwordApplicantController =
      TextEditingController();
  final TextEditingController repasswordApplicantController =
      TextEditingController();

  //bussiness
  final formKeyBussiness = GlobalKey<FormState>();
  final TextEditingController nameBussinessController = TextEditingController();
  final TextEditingController emailBussinessController =
      TextEditingController();
  final TextEditingController headquartersBussinessController =
      TextEditingController();
  final TextEditingController employeeSizeBussinessController =
      TextEditingController();
  final TextEditingController passwordBussinessController =
      TextEditingController();
  final TextEditingController repasswordBussinessController =
      TextEditingController();

  //screen
  DateTime? currentBackPressTime;
  AxisDirection axisDirection = AxisDirection.right;

  SignUpCubit(
    this._applicantUseCase,
    this._bussinessUseCase,
    this._googleUseCase,
  ) : super(SignUpState(
          isMale: true,
          isHideApplicant: true,
          isHideRepassApplicant: true,
          isHideBussiness: true,
          isHideRepassBussiness: true,
          isLoading: false,
          founding: DateTime.now(),
          currentTab: 0,
          birthday: DateTime(
            DateTime.now().year - 18,
            DateTime.now().month,
            DateTime.now().day,
          ),
        ));

  void changeTab(int value) => emit(state.copyWith(currentTab: value));

  void changeGender(bool isMale) => emit(state.copyWith(isMale: isMale));

  void changeBirthdate(DateTime date) => emit(state.copyWith(birthday: date));

  void changeFounding(DateTime date) => emit(state.copyWith(founding: date));

  void hidePasswordApplicant(bool isHide) =>
      emit(state.copyWith(isHideApplicant: isHide));

  void hideRepasswordApplicant(bool isHide) =>
      emit(state.copyWith(isHideRepassApplicant: isHide));

  void hidePasswordBussiness(bool isHide) =>
      emit(state.copyWith(isHideBussiness: isHide));

  void hideRepasswordBussiness(bool isHide) =>
      emit(state.copyWith(isHideRepassBussiness: isHide));

  Future registerApplicant() async {
    emit(state.copyWith(isLoading: true));
    final response = await _applicantUseCase.call(
        params: RegisterApplicantEntity(
      fullname: nameApplicantController.text,
      email: emailApplicantController.text,
      password: passwordApplicantController.text,
      gender: state.isMale,
      birthday: state.birthday,
    ));
    emit(state.copyWith(dataState: response));
  }

  Future registerBussiness() async {
    emit(state.copyWith(isLoading: true));
    final response = await _bussinessUseCase.call(
        params: RegisterBussinessEntity(
      email: emailBussinessController.text,
      name: nameBussinessController.text,
      employeeSize: employeeSizeBussinessController.text,
      founding: state.founding,
      headquarters: headquartersBussinessController.text,
      password: passwordBussinessController.text,
    ));
    emit(state.copyWith(dataState: response));
  }

  Future registerGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      emit(state.copyWith(isLoading: true));
      final response = await _googleUseCase.call(params: googleUser);
      emit(state.copyWith(dataState: response));
    } else {
      emit(state.copyWith(
          dataState: DataFailed(AppLocal.text.cancel_google_register)));
    }
  }
}
