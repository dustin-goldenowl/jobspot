import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/update_password/cubit/update_password_cubit.dart';
import 'package:jobspot/src/presentations/update_password/domain/use_cases/change_password_use_case.dart';
import 'package:jobspot/src/presentations/update_password/domain/use_cases/validate_password_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_password_test.mocks.dart';

@GenerateMocks([ChangePasswordUseCase, ValidatePassworkUseCase])
void main() {
  late UpdatePasswordCubit updatePasswordCubit;
  late MockChangePasswordUseCase mockChangePasswordUseCase;
  late MockValidatePassworkUseCase mockValidatePassworkUseCase;

  setUp(() {
    mockChangePasswordUseCase = MockChangePasswordUseCase();
    mockValidatePassworkUseCase = MockValidatePassworkUseCase();
    updatePasswordCubit = UpdatePasswordCubit(
        mockChangePasswordUseCase, mockValidatePassworkUseCase);
  });

  group("Test Update Password", () {
    blocTest<UpdatePasswordCubit, UpdatePasswordState>(
      'Test Change Password',
      setUp: () {
        when(mockChangePasswordUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));

        when(mockValidatePassworkUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => updatePasswordCubit,
      act: (bloc) => bloc.changePassword(),
      expect: () => [
        const UpdatePasswordState(
          isLoading: true,
          isHideConfirmPassword: true,
          isHideNewPassword: true,
          isHideOldPassword: true,
        ),
        const UpdatePasswordState(
          isLoading: false,
          isHideConfirmPassword: true,
          isHideNewPassword: true,
          isHideOldPassword: true,
        )
      ],
    );
  });
}
