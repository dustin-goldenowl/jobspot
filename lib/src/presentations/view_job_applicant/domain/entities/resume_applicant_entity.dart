import 'package:jobspot/src/core/enum/application_status.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class ResumeApplicantEntity {
  final String id;
  final String description;
  final ApplicationStatus status;
  final String jobID;
  final ResumeEntity resume;
  final UserEntity applicant;
  final DateTime createAt;

  ResumeApplicantEntity({
    required this.id,
    required this.description,
    required this.status,
    required this.jobID,
    required this.resume,
    required this.applicant,
    required this.createAt,
  });

  ResumeApplicantEntity copyWith({ApplicationStatus? status}) {
    return ResumeApplicantEntity(
      id: id,
      description: description,
      status: status ?? this.status,
      jobID: jobID,
      resume: resume,
      applicant: applicant,
      createAt: createAt,
    );
  }
}
