import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_job/cubit/view_job_cubit.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/use_cases/fetch_job_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../save_job/save_job_test.mocks.dart';
import 'view_job_test.mocks.dart';

class MockJobEntity extends Mock implements JobEntity {}

@GenerateMocks([FetchJobUseCase])
void main() {
  late MockSaveJobUseCase mockSaveJobUseCase;
  late MockFetchJobUseCase mockFetchJobUseCase;
  late ViewJobCubit viewJobCubit;

  setUp(() {
    mockFetchJobUseCase = MockFetchJobUseCase();
    mockSaveJobUseCase = MockSaveJobUseCase();
    viewJobCubit = ViewJobCubit(mockFetchJobUseCase, mockSaveJobUseCase);
  });

  group("Test View Job", () {
    blocTest<ViewJobCubit, ViewJobState>(
      'Test  Save Job',
      setUp: () {
        when(mockSaveJobUseCase.call(params: "jobID"))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewJobCubit,
      act: (bloc) => bloc.saveJob(),
      expect: () => [],
    );
  });
}
