import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/use_cases/save_job_use_case.dart';
import 'package:jobspot/src/presentations/save_job/cubit/save_job_cubit.dart';
import 'package:jobspot/src/presentations/save_job/domain/use_cases/delete_all_save_job_use_case.dart';
import 'package:jobspot/src/presentations/save_job/domain/use_cases/listen_save_job_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_job_test.mocks.dart';

@GenerateMocks([ListenSaveJobUseCase, DeleteAllSaveJobUseCase, SaveJobUseCase])
void main() {
  late SaveJobCubit saveJobCubit;
  late MockListenSaveJobUseCase mockListenSaveJobUseCase;
  late MockDeleteAllSaveJobUseCase mockDeleteAllSaveJobUseCase;
  late MockSaveJobUseCase mockSaveJobUseCase;

  setUp(() {
    mockDeleteAllSaveJobUseCase = MockDeleteAllSaveJobUseCase();
    mockListenSaveJobUseCase = MockListenSaveJobUseCase();
    mockSaveJobUseCase = MockSaveJobUseCase();
    saveJobCubit = SaveJobCubit(
      mockListenSaveJobUseCase,
      mockDeleteAllSaveJobUseCase,
      mockSaveJobUseCase,
    );
  });

  group("Test Save Job", () {
    blocTest<SaveJobCubit, SaveJobState>(
      'Test Delete Save Job',
      setUp: () {
        when(mockSaveJobUseCase.call(params: "jobID"))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => saveJobCubit,
      act: (bloc) => bloc.deleteSaveJob("jobID"),
      expect: () => [const SaveJobState(deleteJobID: "jobID")],
    );

    blocTest<SaveJobCubit, SaveJobState>(
      'Test Delete All Save Job',
      setUp: () {
        when(mockDeleteAllSaveJobUseCase.call())
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => saveJobCubit,
      act: (bloc) => bloc.deleteAllSaveJob(),
      expect: () => [const SaveJobState(isDeleteAllSaveJob: true)],
    );

    blocTest<SaveJobCubit, SaveJobState>(
      'Test Stream All Save Job',
      setUp: () {
        when(mockListenSaveJobUseCase.call())
            .thenAnswer((_) => Stream.value(const DataSuccess([])));
      },
      build: () => saveJobCubit,
      act: (bloc) => bloc.listenSaveJob(),
      expect: () => [const SaveJobState(listJob: [])],
    );
  });
}
