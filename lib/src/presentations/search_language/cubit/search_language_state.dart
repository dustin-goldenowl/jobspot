part of 'search_language_cubit.dart';

class SearchLanguageState extends Equatable {
  const SearchLanguageState({this.countries});

  final List<CountryEntity>? countries;

  SearchLanguageState copyWith({List<CountryEntity>? countries}) {
    return SearchLanguageState(countries: countries ?? this.countries);
  }

  @override
  List<Object?> get props => [countries];
}
