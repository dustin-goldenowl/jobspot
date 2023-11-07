import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';

class ApplyJobEntity {
  String description;
  String jobID;
  String uidJob;
  ResumeEntity resume;

  ApplyJobEntity({
    required this.description,
    required this.jobID,
    required this.resume,
    required this.uidJob,
  });
}
