import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/apply_job/cubit/apply_job_cubit.dart';
import 'package:jobspot/src/presentations/apply_job/domain/use_cases/apply_job_use_case.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/use_cases/get_resume_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'apply_job_test.mocks.dart';

@GenerateMocks([ApplyJobUseCase, GetResumeUseCase])
void main() {
  late ApplyJobCubit applyJobCubit;
  late MockApplyJobUseCase mockApplyJobUseCase;
  late MockGetResumeUseCase mockGetResumeUseCase;

  setUp(() {
    mockApplyJobUseCase = MockApplyJobUseCase();
    mockGetResumeUseCase = MockGetResumeUseCase();
    applyJobCubit = ApplyJobCubit(mockApplyJobUseCase, mockGetResumeUseCase);
  });

  group("Test Apply Job", () {
    blocTest<ApplyJobCubit, ApplyJobState>(
      'Test Apply Job',
      setUp: () {
        when(mockApplyJobUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess("id")));
      },
      build: () => applyJobCubit,
      act: (bloc) => bloc.applyJob(jobID: "jobID", uidJob: "uidJob"),
      expect: () => [
        const ApplyJobState(isTop: false, isLoading: true),
        const ApplyJobState(
          isTop: false,
          dataState: DataSuccess<String>("id"),
          applyID: "id",
        ),
      ],
    );
  });
}
