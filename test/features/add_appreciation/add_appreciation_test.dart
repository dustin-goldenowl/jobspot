import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_appreciation/cubit/add_appreciation_cubit.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/add_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/delete_appreciation_use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/use_cases/update_appreciation_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_appreciation_test.mocks.dart';

@GenerateMocks([
  AddAppreciationUseCase,
  UpdateAppreciationUseCase,
  DeleteAppreciationUseCase,
])
void main() {
  late AddAppreciationCubit addAppreciationCubit;
  late MockAddAppreciationUseCase mockAddAppreciationUseCase;
  late MockUpdateAppreciationUseCase mockUpdateAppreciationUseCase;
  late MockDeleteAppreciationUseCase mockDeleteAppreciationUseCase;

  setUp(() {
    mockAddAppreciationUseCase = MockAddAppreciationUseCase();
    mockDeleteAppreciationUseCase = MockDeleteAppreciationUseCase();
    mockUpdateAppreciationUseCase = MockUpdateAppreciationUseCase();
    addAppreciationCubit = AddAppreciationCubit(
      mockAddAppreciationUseCase,
      mockUpdateAppreciationUseCase,
      mockDeleteAppreciationUseCase,
    );
  });

  group("Test Add Appreciation", () {
    blocTest<AddAppreciationCubit, AddAppreciationState>(
      'Test Add Appreciation',
      setUp: () {
        when(mockAddAppreciationUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addAppreciationCubit,
      act: (bloc) => bloc.addAppreciation(),
      expect: () => [
        AddAppreciationState(
          endDate: DateTime.now().getDate,
          isLoading: true,
          error: null,
        ),
        AddAppreciationState(
          endDate: DateTime.now().getDate,
          isLoading: false,
          error: null,
        ),
      ],
    );

    blocTest<AddAppreciationCubit, AddAppreciationState>(
      'Test Update Appreciation',
      setUp: () {
        when(mockUpdateAppreciationUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addAppreciationCubit,
      act: (bloc) => bloc.updateAppreciation(),
      expect: () => [
        AddAppreciationState(
          endDate: DateTime.now().getDate,
          isLoading: true,
          error: null,
        ),
        AddAppreciationState(
          endDate: DateTime.now().getDate,
          isLoading: false,
          error: null,
        ),
      ],
    );

    blocTest<AddAppreciationCubit, AddAppreciationState>(
      'Test Delete Appreciation',
      setUp: () {
        when(mockDeleteAppreciationUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addAppreciationCubit,
      act: (bloc) => bloc.deleteAppreciation(),
      expect: () => [
        AddAppreciationState(
          endDate: DateTime.now().getDate,
          isLoading: true,
          error: null,
        ),
        AddAppreciationState(
          endDate: DateTime.now().getDate,
          isLoading: false,
          error: null,
        ),
      ],
    );
  });
}
