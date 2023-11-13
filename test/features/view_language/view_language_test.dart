import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/domain/use_cases/delete_language_use_case.dart';
import 'package:jobspot/src/presentations/view_language/cubit/view_language_cubit.dart';
import 'package:jobspot/src/presentations/view_language/domain/use_cases/stream_language_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'view_language_test.mocks.dart';

@GenerateMocks([StreamLanguagesUseCase, DeleteLanguageUseCase])
void main() {
  late ViewLanguageCubit viewLanguageCubit;
  late MockStreamLanguagesUseCase mockStreamLanguagesUseCase;
  late MockDeleteLanguageUseCase mockDeleteLanguageUseCase;

  setUp(() {
    mockStreamLanguagesUseCase = MockStreamLanguagesUseCase();
    mockDeleteLanguageUseCase = MockDeleteLanguageUseCase();
    viewLanguageCubit = ViewLanguageCubit(
        mockStreamLanguagesUseCase, mockDeleteLanguageUseCase);
  });

  group("Test View Language", () {
    blocTest<ViewLanguageCubit, ViewLanguageState>(
      'Test Get Language',
      setUp: () {
        when(mockStreamLanguagesUseCase.call())
            .thenAnswer((_) => Stream.value(const DataSuccess([])));
      },
      build: () => viewLanguageCubit,
      act: (bloc) => bloc.getLanguage(),
      expect: () => [const ViewLanguageState(listLanguage: [])],
    );

    blocTest<ViewLanguageCubit, ViewLanguageState>(
      'Test Delete Language',
      setUp: () {
        when(mockDeleteLanguageUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => viewLanguageCubit,
      act: (bloc) => bloc.deleteLanguage("languageID"),
      expect: () => [],
    );
  });
}
