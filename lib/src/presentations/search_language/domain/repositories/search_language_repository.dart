import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';

abstract class SearchLanguageRepository {
  Future<DataState<List<CountryEntity>>> getCountries();
}
