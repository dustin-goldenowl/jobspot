import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_up/cubit/sign_up_cubit.dart';
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_applicant_use_case.dart';
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_business_use_case.dart';
import 'package:jobspot/src/presentations/sign_up/domain/use_cases/register_google_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_up_test.mocks.dart';

// ignore: must_be_immutable
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

@GenerateMocks([
  RegisterApplicantUseCase,
  RegisterBusinessUseCase,
  RegisterGoogleUseCase,
])
void main() {
  late SignUpCubit signUpCubit;
  late MockRegisterApplicantUseCase mockRegisterApplicantUseCase;
  late MockRegisterGoogleUseCase mockRegisterGoogleUseCase;
  late MockRegisterBusinessUseCase mockRegisterBusinessUseCase;

  setUp(() {
    mockRegisterApplicantUseCase = MockRegisterApplicantUseCase();
    mockRegisterGoogleUseCase = MockRegisterGoogleUseCase();
    mockRegisterBusinessUseCase = MockRegisterBusinessUseCase();
    signUpCubit = SignUpCubit(
      mockRegisterApplicantUseCase,
      mockRegisterBusinessUseCase,
      mockRegisterGoogleUseCase,
    );
  });

  group("Test Sign In", () {
    blocTest<SignUpCubit, SignUpState>(
      'sign up test register applicant',
      setUp: () {
        when(mockRegisterApplicantUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => signUpCubit,
      act: (bloc) => bloc.registerApplicant(),
      expect: () => [
        SignUpState(
          isHideApplicant: true,
          isHideRepassApplicant: true,
          isHideBusiness: true,
          isHideRepassBusiness: true,
          isMale: true,
          isLoading: true,
          birthday: DateTime(
            DateTime.now().year - 18,
            DateTime.now().month,
            DateTime.now().day,
          ),
          founding: DateTime.now().getDate,
          isGoogle: false,
          dataState: null,
        ),
        SignUpState(
          isHideApplicant: true,
          isHideRepassApplicant: true,
          isHideBusiness: true,
          isHideRepassBusiness: true,
          isMale: true,
          isLoading: false,
          birthday: DateTime(
            DateTime.now().year - 18,
            DateTime.now().month,
            DateTime.now().day,
          ),
          founding: DateTime.now().getDate,
          isGoogle: false,
          dataState: const DataSuccess(true),
        )
      ],
    );

    blocTest<SignUpCubit, SignUpState>(
      'sign up test register business',
      setUp: () {
        when(mockRegisterBusinessUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => signUpCubit,
      act: (bloc) => bloc.registerBusiness(),
      expect: () => [
        SignUpState(
          isHideApplicant: true,
          isHideRepassApplicant: true,
          isHideBusiness: true,
          isHideRepassBusiness: true,
          isMale: true,
          isLoading: true,
          birthday: DateTime(
            DateTime.now().year - 18,
            DateTime.now().month,
            DateTime.now().day,
          ),
          founding: DateTime.now().getDate,
          isGoogle: false,
          dataState: null,
        ),
        SignUpState(
          isHideApplicant: true,
          isHideRepassApplicant: true,
          isHideBusiness: true,
          isHideRepassBusiness: true,
          isMale: true,
          isLoading: false,
          birthday: DateTime(
            DateTime.now().year - 18,
            DateTime.now().month,
            DateTime.now().day,
          ),
          founding: DateTime.now().getDate,
          isGoogle: false,
          dataState: const DataSuccess(true),
        )
      ],
    );

    blocTest<SignUpCubit, SignUpState>(
      'sign up test register google',
      setUp: () {
        when(mockRegisterGoogleUseCase.call(params: MockGoogleSignInAccount()))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => signUpCubit,
      act: (bloc) => bloc.registerGoogle(),
      expect: () => [],
    );
  });
}
