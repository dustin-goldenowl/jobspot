import 'package:jobspot/src/presentations/search_language/data/models/country_model.dart';

class DataCountriesModel {
  String status;
  int statusCode;
  List<CountryModel> data;

  DataCountriesModel({
    required this.data,
    required this.status,
    required this.statusCode,
  });

  factory DataCountriesModel.fromJson(Map<String, dynamic> json) {
    return DataCountriesModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      statusCode: json['status-code'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status-code': statusCode,
      'data': data,
    };
  }
}
