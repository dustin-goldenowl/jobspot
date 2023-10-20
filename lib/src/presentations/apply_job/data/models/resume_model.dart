import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/resume_entity.dart';

class ResumeModel {
  String fileName;
  String description;
  String jobID;
  int size;
  String? file;

  ResumeModel({
    required this.description,
    required this.jobID,
    required this.fileName,
    required this.size,
    this.file,
  });

  factory ResumeModel.fromCVEntity(ResumeEntity entity) {
    return ResumeModel(
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
