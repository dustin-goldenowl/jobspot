import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/api/country_api_service.dart';
import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';
import 'package:jobspot/src/presentations/search_language/domain/repositories/search_language_repository.dart';

@LazySingleton(as: SearchLanguageRepository)
class SearchLanguageRepositoryImpl extends SearchLanguageRepository {
  @override
  Future<DataState<List<CountryEntity>>> getCountries() async {
    try {
      final response = await CountryApiService.getListCountries();
      if (response != null) {
        return DataSuccess(response.data.map((e) => e.toEntity()).toList());
      }
      return DataSuccess([]);
    } catch (e) {
      log(e.toString());
      return DataFailed(e.toString());
    }
  }
}
