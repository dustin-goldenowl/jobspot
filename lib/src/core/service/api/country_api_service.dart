import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jobspot/src/presentations/search_language/data/models/data_countries_model.dart';

class CountryApiService {
  CountryApiService._();

  static String get _countriesURL =>
      "https://gist.githubusercontent.com/WalterGoldenOwl/71d7b7b248c54af422f23a2bc7fe603a/raw/83e3b582ee4880d945df02a3ea79272f34577594/countries.json";

  static Future<DataCountriesModel?> getListCountries() async {
    try {
      final data = await Dio().get(_countriesURL);
      final response = DataCountriesModel.fromJson(jsonDecode(data.data));
      return response;
    } catch (e) {
      return null;
    }
  }
}
