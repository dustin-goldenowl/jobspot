import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/cubit/add_language_cubit.dart';
import 'package:jobspot/src/presentations/add_language/domain/use_cases/add_language_use_case.dart';
import 'package:jobspot/src/presentations/add_language/domain/use_cases/update_language_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_language_test.mocks.dart';

@GenerateMocks([AddLanguageUseCase, UpdateLanguageUseCase])
void main() {
  late AddLanguageCubit addLanguageCubit;
  late MockAddLanguageUseCase mockAddLanguageUseCase;
  late MockUpdateLanguageUseCase mockUpdateLanguageUseCase;

  setUp(() {
    mockAddLanguageUseCase = MockAddLanguageUseCase();
    mockUpdateLanguageUseCase = MockUpdateLanguageUseCase();
    addLanguageCubit =
        AddLanguageCubit(mockAddLanguageUseCase, mockUpdateLanguageUseCase);
  });

  group("Test Add Language", () {
    blocTest<AddLanguageCubit, AddLanguageState>(
      'Test Add Language',
      setUp: () {
        when(mockAddLanguageUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addLanguageCubit,
      act: (bloc) => bloc.addLanguage(),
      expect: () => [
        const AddLanguageState(
          isLoading: true,
          isFirst: false,
          oralLevel: 0,
          writtenLevel: 0,
        ),
        const AddLanguageState(
          isLoading: false,
          isFirst: false,
          oralLevel: 0,
          writtenLevel: 0,
        ),
      ],
    );

    blocTest<AddLanguageCubit, AddLanguageState>(
      'Test Update Language',
      setUp: () {
        when(mockUpdateLanguageUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addLanguageCubit,
      act: (bloc) => bloc.updateLanguage(),
      expect: () => [
        const AddLanguageState(
          isLoading: true,
          isFirst: false,
          oralLevel: 0,
          writtenLevel: 0,
        ),
        const AddLanguageState(
          isLoading: false,
          isFirst: false,
          oralLevel: 0,
          writtenLevel: 0,
        ),
      ],
    );
  });
}
