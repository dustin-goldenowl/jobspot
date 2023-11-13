import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_job_applicant/cubit/view_job_applicant_cubit.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/consider_resume.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/consider_resume_use_case.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/use_cases/get_list_applicant_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'view_job_applicant_test.mocks.dart';

class MockConsiderResume extends Mock implements ConsiderResume {}

@GenerateMocks([GetListApplicantUseCase, ConsiderResumeUseCase])
void main() {
  late ViewJobApplicantCubit viewJobApplicantCubit;
  late MockGetListApplicantUseCase mockGetListApplicantUseCase;
  late MockConsiderResumeUseCase mockConsiderResumeUseCase;

  setUp(() {
    mockGetListApplicantUseCase = MockGetListApplicantUseCase();
    mockConsiderResumeUseCase = MockConsiderResumeUseCase();
    viewJobApplicantCubit = ViewJobApplicantCubit(
        mockGetListApplicantUseCase, mockConsiderResumeUseCase);
  });

  group("Test Save Job", () {
    blocTest<ViewJobApplicantCubit, ViewJobApplicantState>(
      'Test Get List Applicant',
      setUp: () {
        when(mockGetListApplicantUseCase.call(params: "jobID"))
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => viewJobApplicantCubit,
      act: (bloc) => bloc.getListApplicant("jobID"),
      expect: () => [const ViewJobApplicantState(listResume: [])],
    );

    blocTest<ViewJobApplicantCubit, ViewJobApplicantState>(
      'Test Delete Save Job',
      setUp: () {
        when(mockConsiderResumeUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewJobApplicantCubit,
      act: (bloc) => bloc.considerResume(MockConsiderResume()),
      expect: () => [const ViewJobApplicantState(listResume: [])],
    );
  });
}
