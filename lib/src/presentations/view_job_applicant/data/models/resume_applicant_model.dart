import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/resume_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';

class ResumeApplicantModel {
  String id;
  String description;
  String resumeID;
  String owner;
  bool? isAccept;
  ResumeModel? resume;
  UserModel? applicant;
  DateTime createAt;

  ResumeApplicantModel({
    required this.id,
    required this.description,
    required this.owner,
    required this.resumeID,
    required this.isAccept,
    this.resume,
    this.applicant,
    required this.createAt,
  });

  ResumeApplicantModel copyWith({
    ResumeModel? resume,
    UserModel? applicant,
  }) {
    return ResumeApplicantModel(
      id: id,
      description: description,
      owner: owner,
      resumeID: resumeID,
      createAt: createAt,
      isAccept: isAccept,
      applicant: applicant ?? this.applicant,
      resume: resume ?? this.resume,
    );
  }

  factory ResumeApplicantModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return ResumeApplicantModel(
      id: snapshot.id,
      isAccept: data["isAccept"],
      description: data["description"],
      createAt: (data["createAt"] as Timestamp).toDate(),
      owner: data["owner"],
      resumeID: data["resumeID"],
    );
  }

  ResumeApplicantEntity toResumeApplicantEntity() {
    return ResumeApplicantEntity(
      id: id,
      description: description,
      isAccept: isAccept,
      resume: resume!.toResumeEntity(),
      applicant: applicant!.toUserEntity(),
      createAt: createAt,
    );
  }
}
