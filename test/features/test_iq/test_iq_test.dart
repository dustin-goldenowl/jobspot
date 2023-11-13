import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/test_iq/cubit/test_iq_cubit.dart';
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/add_result_test_iq_use_case.dart';
import 'package:jobspot/src/presentations/test_iq/domain/use_cases/get_list_question_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_iq_test.mocks.dart';

@GenerateMocks([GetListQuestionUseCase, AddResultTestIQUseCase])
void main() {
  late MockGetListQuestionUseCase mockGetListQuestionUseCase;
  late MockAddResultTestIQUseCase mockAddResultTestIQUseCase;
  late TestIQCubit testIQCubit;

  setUp(() {
    mockAddResultTestIQUseCase = MockAddResultTestIQUseCase();
    mockGetListQuestionUseCase = MockGetListQuestionUseCase();
    testIQCubit =
        TestIQCubit(mockGetListQuestionUseCase, mockAddResultTestIQUseCase);
  });

  group("Test IQ", () {
    blocTest<TestIQCubit, TestIQState>(
      'Test Get List IQ',
      setUp: () {
        when(mockGetListQuestionUseCase.call())
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => testIQCubit,
      act: (bloc) => bloc.getListQuestion(),
      expect: () => [
        const TestIQState(questions: [], answers: [], currentPage: 0, time: 300)
      ],
    );

    blocTest<TestIQCubit, TestIQState>(
      'Test Add Result IQ',
      setUp: () {
        when(mockGetListQuestionUseCase.call())
            .thenAnswer((_) => Future.value(const DataSuccess([])));

        when(mockAddResultTestIQUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => testIQCubit,
      act: (bloc) {
        bloc.getListQuestion();
        bloc.addResultTestIQ();
      },
      expect: () => [
        const TestIQState(questions: [], answers: [], currentPage: 0, time: 300)
      ],
    );
  });
}
