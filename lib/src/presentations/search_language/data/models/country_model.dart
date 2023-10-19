import 'package:jobspot/src/presentations/search_language/domain/entities/country_entity.dart';

class CountryModel {
  String code;
  String name;

  CountryModel({required this.code, required this.name});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'code': code, 'name': name};

  CountryEntity toEntity() => CountryEntity(code: code, name: name);
}
