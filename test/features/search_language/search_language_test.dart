import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/search_language/cubit/search_language_cubit.dart';
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_language_test.mocks.dart';

@GenerateMocks([GetCountriesUseCase])
void main() {
  late MockGetCountriesUseCase mockGetCountriesUseCase;
  late SearchLanguageCubit searchLanguageCubit;

  setUp(() {
    mockGetCountriesUseCase = MockGetCountriesUseCase();
    searchLanguageCubit = SearchLanguageCubit(mockGetCountriesUseCase);
  });

  group("Test Search Language", () {
    blocTest<SearchLanguageCubit, SearchLanguageState>(
      'Test Search Language',
      setUp: () {
        when(mockGetCountriesUseCase.call(params: anyNamed("params")))
            .thenAnswer((_) => Future.value(const DataSuccess([])));
      },
      build: () => searchLanguageCubit,
      act: (bloc) => bloc.getCountries(),
      expect: () => [const SearchLanguageState(countries: [])],
    );
  });
}
