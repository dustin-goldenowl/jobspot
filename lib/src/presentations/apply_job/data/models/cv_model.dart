import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/cv_entity.dart';

class CVModel {
  String fileName;
  String description;
  String jobID;
  int size;
  String? file;

  CVModel({
    required this.description,
    required this.jobID,
    required this.fileName,
    required this.size,
    this.file,
  });

  factory CVModel.fromCVEntity(CVEntity entity) {
    return CVModel(
      description: entity.description,
      jobID: entity.jobID,
      fileName: entity.fileName,
      size: entity.size,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "jobID": jobID,
      "fileName": fileName,
      "file": file,
      "size": size,
      "owner": FirebaseAuth.instance.currentUser!.uid,
      "createAt": DateTime.now(),
      "updateAt": DateTime.now(),
    };
  }
}
