import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/job_position/cubit/job_position_cubit.dart';
import 'package:jobspot/src/presentations/job_position/domain/use_cases/search_job_position_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'job_position_test.mocks.dart';

@GenerateMocks([SearchJobPositionUseCase])
void main() {
  late MockSearchJobPositionUseCase mockSearchJobPositionUseCase;

  setUp(() {
    mockSearchJobPositionUseCase = MockSearchJobPositionUseCase();
    when(mockSearchJobPositionUseCase.call(params: anyNamed('params')))
        .thenAnswer((_) => Future.value(const DataSuccess(["a", "b"])));
  });

  blocTest<JobPositionCubit, JobPositionState>(
    'Test JobPositionCubit',
    build: () => JobPositionCubit(mockSearchJobPositionUseCase),
    act: (bloc) => bloc.searchJobPosition(),
    expect: () => [
      const JobPositionState(text: "", dataState: DataSuccess(["a", "b"]))
    ],
  );
}
