import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';
import 'package:jobspot/src/presentations/search_language/domain/use_cases/get_countries_use_case.dart';

part 'search_language_state.dart';

@injectable
class SearchLanguageCubit extends Cubit<SearchLanguageState> {
  final searchController = TextEditingController();

  final GetCountriesUseCase _useCase;

  final List<CountryEntity> countries = [];

  SearchLanguageCubit(this._useCase) : super(const SearchLanguageState()) {
    getCountries();
    searchController.addListener(() => _search());
  }

  Future getCountries() async {
    final response = await _useCase.call();
    if (response is DataSuccess) {
      countries.addAll(response.data!);
      emit(state.copyWith(countries: countries));
    }
  }

  void _search() {
    final response = countries
        .where((element) => element.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
    emit(state.copyWith(countries: response));
  }
}
