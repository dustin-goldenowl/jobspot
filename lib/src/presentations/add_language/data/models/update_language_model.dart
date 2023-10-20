import 'package:jobspot/src/presentations/add_language/domain/entities/update_language_entity.dart';

class UpdateLanguageModel {
  String id;
  String name;
  String code;
  bool isFirst;
  int oralLevel;
  int writtenLevel;

  UpdateLanguageModel({
    required this.id,
    required this.name,
    required this.code,
    required this.isFirst,
    required this.oralLevel,
    required this.writtenLevel,
  });

  factory UpdateLanguageModel.fromEntity(UpdateLanguageEntity entity) {
    return UpdateLanguageModel(
      id: entity.id,
      name: entity.name,
      code: entity.code,
      isFirst: entity.isFirst,
      oralLevel: entity.oralLevel,
      writtenLevel: entity.writtenLevel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "code": code,
      "isFirst": isFirst,
      "oralLevel": oralLevel,
      "writtenLevel": writtenLevel,
      "updateAt": DateTime.now(),
    };
  }
}
