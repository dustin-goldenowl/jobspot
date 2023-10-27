import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class ResumeApplicantEntity {
  final String id;
  final String description;
  final bool? isAccept;
  final String jobID;
  final ResumeEntity resume;
  final UserEntity applicant;
  final DateTime createAt;

  ResumeApplicantEntity({
    required this.id,
    required this.description,
    required this.isAccept,
    required this.jobID,
    required this.resume,
    required this.applicant,
    required this.createAt,
  });

  ResumeApplicantEntity copyWith({bool? isAccept}) {
    return ResumeApplicantEntity(
      id: id,
      description: description,
      isAccept: isAccept ?? this.isAccept,
      jobID: jobID,
      resume: resume,
      applicant: applicant,
      createAt: createAt,
    );
  }
}
