import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/verify_business/cubit/verify_business_cubit.dart';
import 'package:jobspot/src/presentations/verify_business/domain/use_cases/upload_file_verify_business_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'verify_business_test.mocks.dart';

@GenerateMocks([UploadFileVerifyBusinessUseCase])
void main() {
  late VerifyBusinessCubit verifyBusinessCubit;
  late MockUploadFileVerifyBusinessUseCase mockUploadFileVerifyBusinessUseCase;

  setUp(() {
    mockUploadFileVerifyBusinessUseCase = MockUploadFileVerifyBusinessUseCase();
    verifyBusinessCubit =
        VerifyBusinessCubit(mockUploadFileVerifyBusinessUseCase);
  });

  group("Test Verify Business", () {
    blocTest<VerifyBusinessCubit, VerifyBusinessState>(
      'Test Upload Verify Business',
      setUp: () {
        when(mockUploadFileVerifyBusinessUseCase.call(
                params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => verifyBusinessCubit,
      act: (bloc) => bloc.uploadFile(),
      expect: () => [
        const VerifyBusinessState(isLoading: true),
        const VerifyBusinessState(isLoading: false)
      ],
    );
  });
}
