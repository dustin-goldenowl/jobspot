import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/verify_business/domain/entities/verify_business_entity.dart';

class VerifyBusinessModel {
  PlatformFile file;
  String? link;
  String description;

  VerifyBusinessModel({
    required this.file,
    this.link,
    required this.description,
  });

  factory VerifyBusinessModel.fromEntity(VerifyBusinessEntity entity) {
    return VerifyBusinessModel(
      file: entity.file,
      description: entity.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fileName": file.name,
      "file": link,
      "size": file.size,
      "description": description,
      "company": FirebaseAuth.instance.currentUser!.uid,
      "creatAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
