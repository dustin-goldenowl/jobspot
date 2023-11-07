import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/update_language_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';

class LanguageModel {
  final String id;
  final String name;
  final String code;
  final bool isFirst;
  final int oralLevel;
  final int writtenLevel;

  LanguageModel({
    required this.id,
    required this.name,
    required this.code,
    required this.isFirst,
    required this.oralLevel,
    required this.writtenLevel,
  });

  factory LanguageModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return LanguageModel(
      id: snapshot.id,
      name: data["name"],
      code: data["code"],
      isFirst: data["isFirst"],
      oralLevel: data["oralLevel"],
      writtenLevel: data["writtenLevel"],
    );
  }

  factory LanguageModel.fromEntity(LanguageEntity entity) {
    return LanguageModel(
      id: entity.id,
      name: entity.name,
      code: entity.code,
      isFirst: entity.isFirst,
      oralLevel: entity.oralLevel,
      writtenLevel: entity.writtenLevel,
    );
  }

  UpdateLanguageEntity toUpdateLanguageEntity() {
    return UpdateLanguageEntity(
      id: id,
      name: name,
      code: code,
      isFirst: isFirst,
      oralLevel: oralLevel,
      writtenLevel: writtenLevel,
    );
  }

  LanguageEntity toLanguageEntity() {
    return LanguageEntity(
      id: id,
      name: name,
      code: code,
      isFirst: isFirst,
      oralLevel: oralLevel,
      writtenLevel: writtenLevel,
    );
  }
}
