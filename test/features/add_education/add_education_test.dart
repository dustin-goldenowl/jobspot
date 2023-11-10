import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/extension/date_time_extension.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_education/cubit/add_education_cubit.dart';
import 'package:jobspot/src/presentations/add_education/domain/use_cases/add_education_use_case.dart';
import 'package:jobspot/src/presentations/add_education/domain/use_cases/delete_education_use_case.dart';
import 'package:jobspot/src/presentations/add_education/domain/use_cases/update_education_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_education_test.mocks.dart';

@GenerateMocks([
  AddEducationUseCase,
  UpdateEducationUseCase,
  DeleteEducationUseCase,
])
void main() {
  late AddEducationCubit addEducationCubit;
  late MockAddEducationUseCase mockAddEducationUseCase;
  late MockUpdateEducationUseCase mockUpdateEducationUseCase;
  late MockDeleteEducationUseCase mockDeleteEducationUseCase;

  setUp(() {
    mockAddEducationUseCase = MockAddEducationUseCase();
    mockDeleteEducationUseCase = MockDeleteEducationUseCase();
    mockUpdateEducationUseCase = MockUpdateEducationUseCase();
    addEducationCubit = AddEducationCubit(
      mockAddEducationUseCase,
      mockDeleteEducationUseCase,
      mockUpdateEducationUseCase,
    );
  });
  group("Test Add Education", () {
    blocTest<AddEducationCubit, AddEducationState>(
      'Test Add Education',
      setUp: () {
        when(mockAddEducationUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addEducationCubit,
      act: (bloc) => bloc.addEducation(),
      expect: () => [
        AddEducationState(
          endDate: DateTime.now().getDate,
          isEduNow: false,
          startDate: DateTime.now().getDate,
          isLoading: true,
        ),
        AddEducationState(
          endDate: DateTime.now().getDate,
          isEduNow: false,
          startDate: DateTime.now().getDate,
          isLoading: false,
        ),
      ],
    );

    blocTest<AddEducationCubit, AddEducationState>(
      'Test Update Education',
      setUp: () {
        when(mockUpdateEducationUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addEducationCubit,
      act: (bloc) => bloc.updateEducation(),
      expect: () => [
        AddEducationState(
          endDate: DateTime.now().getDate,
          isEduNow: false,
          startDate: DateTime.now().getDate,
          isLoading: true,
        ),
        AddEducationState(
          endDate: DateTime.now().getDate,
          isEduNow: false,
          startDate: DateTime.now().getDate,
          isLoading: false,
        ),
      ],
    );

    blocTest<AddEducationCubit, AddEducationState>(
      'Test Delete Education',
      setUp: () {
        when(mockDeleteEducationUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addEducationCubit,
      act: (bloc) => bloc.deleteEducation(),
      expect: () => [
        AddEducationState(
          endDate: DateTime.now().getDate,
          isEduNow: false,
          startDate: DateTime.now().getDate,
          isLoading: true,
        ),
        AddEducationState(
          endDate: DateTime.now().getDate,
          isEduNow: false,
          startDate: DateTime.now().getDate,
          isLoading: false,
        ),
      ],
    );
  });
}
