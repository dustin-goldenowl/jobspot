import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobspot/src/core/enum/application_status.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/applicant_profile/data/models/resume_model.dart';
import 'package:jobspot/src/presentations/connection/data/models/user_model.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';

class ResumeApplicantModel {
  String id;
  String description;
  String resumeID;
  String owner;
  String jobID;
  ApplicationStatus status;
  ResumeModel? resume;
  UserModel? applicant;
  DateTime createAt;

  ResumeApplicantModel({
    required this.id,
    required this.description,
    required this.owner,
    required this.resumeID,
    required this.status,
    required this.jobID,
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
      status: status,
      jobID: jobID,
      applicant: applicant ?? this.applicant,
      resume: resume ?? this.resume,
    );
  }

  factory ResumeApplicantModel.fromDocumentSnapshot(MapSnapshot snapshot) {
    final data = snapshot.data()!;
    return ResumeApplicantModel(
      id: snapshot.id,
      status: data["status"] == "pending"
          ? ApplicationStatus.pending
          : data["status"] == "accept"
              ? ApplicationStatus.accept
              : ApplicationStatus.decline,
      description: data["description"],
      createAt: (data["createAt"] as Timestamp).toDate(),
      owner: data["owner"],
      resumeID: data["resumeID"],
      jobID: data["jobID"],
    );
  }

  ResumeApplicantEntity toResumeApplicantEntity() {
    return ResumeApplicantEntity(
      id: id,
      description: description,
      status: status,
      resume: resume!.toResumeEntity(),
      applicant: applicant!.toUserEntity(),
      createAt: createAt,
      jobID: jobID,
    );
  }
}
