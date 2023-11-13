import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_work_experience/cubit/add_work_experience_cubit.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/add_experience_use_case.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/delete_experience_use_case.dart';
import 'package:jobspot/src/presentations/add_work_experience/domain/use_cases/update_experience_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_work_experience_test.mocks.dart';

@GenerateMocks([
  AddExperienceUseCase,
  UpdateExperienceUseCase,
  DeleteExperienceUseCase,
])
void main() {
  late AddWorkExperienceCubit addWorkExperienceCubit;
  late MockAddExperienceUseCase mockAddExperienceUseCase;
  late MockUpdateExperienceUseCase mockUpdateExperienceUseCase;
  late MockDeleteExperienceUseCase mockDeleteExperienceUseCase;

  setUp(() {
    mockAddExperienceUseCase = MockAddExperienceUseCase();
    mockUpdateExperienceUseCase = MockUpdateExperienceUseCase();
    mockDeleteExperienceUseCase = MockDeleteExperienceUseCase();
    addWorkExperienceCubit = AddWorkExperienceCubit(
      mockAddExperienceUseCase,
      mockUpdateExperienceUseCase,
      mockDeleteExperienceUseCase,
    );
  });

  group("Test Add Experience", () {
    blocTest<AddWorkExperienceCubit, AddWorkExperienceState>(
      'Test Add Experience',
      setUp: () {
        when(mockAddExperienceUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addWorkExperienceCubit,
      act: (bloc) => bloc.addWorkExperience(),
      expect: () => [
        AddWorkExperienceState(
          endDate: DateTime.now().getDate,
          startDate: DateTime.now().getDate,
          isWorkNow: false,
          isLoading: true,
        ),
        AddWorkExperienceState(
          endDate: DateTime.now().getDate,
          startDate: DateTime.now().getDate,
          isWorkNow: false,
          isLoading: false,
        ),
      ],
    );

    blocTest<AddWorkExperienceCubit, AddWorkExperienceState>(
      'Test Update Experience',
      setUp: () {
        when(mockUpdateExperienceUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addWorkExperienceCubit,
      act: (bloc) => bloc.updateWorkExperience(),
      expect: () => [
        AddWorkExperienceState(
          endDate: DateTime.now().getDate,
          startDate: DateTime.now().getDate,
          isWorkNow: false,
          isLoading: true,
        ),
        AddWorkExperienceState(
          endDate: DateTime.now().getDate,
          startDate: DateTime.now().getDate,
          isWorkNow: false,
          isLoading: false,
        ),
      ],
    );

    blocTest<AddWorkExperienceCubit, AddWorkExperienceState>(
      'Test Delete Experience',
      setUp: () {
        when(mockDeleteExperienceUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addWorkExperienceCubit,
      act: (bloc) => bloc.deleteWorkExperience(),
      expect: () => [
        AddWorkExperienceState(
          endDate: DateTime.now().getDate,
          startDate: DateTime.now().getDate,
          isWorkNow: false,
          isLoading: true,
        ),
        AddWorkExperienceState(
          endDate: DateTime.now().getDate,
          startDate: DateTime.now().getDate,
          isWorkNow: false,
          isLoading: false,
        ),
      ],
    );
  });
}
