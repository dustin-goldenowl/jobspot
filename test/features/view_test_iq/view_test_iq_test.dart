import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_test_iq/cubit/view_test_iq_cubit.dart';
import 'package:mockito/mockito.dart';

import '../test_iq/test_iq_test.mocks.dart';

void main() {
  late MockGetListQuestionUseCase mockGetListQuestionUseCase;
  late ViewTestIQCubit viewTestIQCubit;

  setUp(() {
    mockGetListQuestionUseCase = MockGetListQuestionUseCase();
    viewTestIQCubit = ViewTestIQCubit(mockGetListQuestionUseCase);
  });

  group("Test Save Job", () {
    blocTest<ViewTestIQCubit, ViewTestIQState>(
      'Test Delete Save Job',
      setUp: () {
        when(mockGetListQuestionUseCase.call())
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => viewTestIQCubit,
      act: (bloc) => bloc.getListQuestion([]),
      expect: () => [const ViewTestIQState(answers: [], questions: [])],
    );
  });
}
