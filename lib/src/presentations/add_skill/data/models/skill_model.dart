import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';
import 'package:jobspot/src/presentations/add_skill/domain/entities/skill_entity.dart';

class SkillModel {
  String? id;
  String title;

  SkillModel({this.id, required this.title});

  factory SkillModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return SkillModel(id: snapshot.id, title: data["title"]);
  }

  SkillEntity toSkillEntity() =>
      SkillEntity(id: id, title: title.capitalizedString);
}
