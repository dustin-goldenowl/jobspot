import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';

class SkillModel {
  String? id;
  String title;

  SkillModel({this.id, required this.title});

  factory SkillModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return SkillModel(id: snapshot.id, title: data["title"]);
  }

  SkillEntity toSkillEntity() =>
      SkillEntity(id: id, title: title.capitalizedString);
}
