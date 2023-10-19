import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/add_resume/domain/entities/add_resume_entity.dart';

class AddResumeModel {
  String fileName;
  int size;
  String? file;

  AddResumeModel({
    required this.fileName,
    required this.size,
    this.file,
  });

  factory AddResumeModel.fromEntity(AddResumeEntity entity) {
    return AddResumeModel(
      fileName: entity.fileName,
      size: entity.size,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fileName": fileName,
      "file": file,
      "size": size,
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
