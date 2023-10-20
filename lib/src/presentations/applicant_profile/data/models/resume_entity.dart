import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';

class ResumeModel {
  final String id;
  final String fileName;
  final String file;
  final int size;
  final DateTime createAt;

  ResumeModel({
    required this.id,
    required this.fileName,
    required this.file,
    required this.size,
    required this.createAt,
  });

  factory ResumeModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return ResumeModel(
      id: snapshot.id,
      fileName: data["fileName"],
      file: data["file"],
      size: data["size"],
      createAt: (data["createAt"] as Timestamp).toDate(),
    );
  }

  ResumeEntity toResumeEntity() {
    return ResumeEntity(
      id: id,
      fileName: fileName,
      file: file,
      size: size,
      createAt: createAt,
    );
  }
}
