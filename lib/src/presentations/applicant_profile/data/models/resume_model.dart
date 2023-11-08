import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';

class ResumeModel {
  final String id;
  final String fileName;
  final String filePath;
  final int size;
  final DateTime createAt;

  ResumeModel({
    required this.id,
    required this.fileName,
    required this.filePath,
    required this.size,
    required this.createAt,
  });

  factory ResumeModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return ResumeModel(
      id: snapshot.id,
      fileName: data["fileName"],
      filePath: data["file"],
      size: data["size"],
      createAt: (data["createAt"] as Timestamp).toDate(),
    );
  }

  ResumeEntity toResumeEntity() {
    return ResumeEntity(
      id: id,
      fileName: fileName,
      filePath: filePath,
      size: size,
      createAt: createAt,
    );
  }
}
