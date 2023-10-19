import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/add_language/domain/router/entities/add_language_entity.dart';

class AddLanguageModel {
  String name;
  String code;
  bool isFirst;
  int oralLevel;
  int writtenLevel;

  AddLanguageModel({
    required this.name,
    required this.code,
    required this.isFirst,
    required this.oralLevel,
    required this.writtenLevel,
  });

  factory AddLanguageModel.fromEntity(AddLanguageEntity entity) {
    return AddLanguageModel(
      name: entity.name,
      code: entity.code,
      isFirst: entity.isFirst,
      oralLevel: entity.oralLevel,
      writtenLevel: entity.writtenLevel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "name": name,
      "code": code,
      "isFirst": isFirst,
      "oralLevel": oralLevel,
      "writtenLevel": writtenLevel,
      "creatAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
