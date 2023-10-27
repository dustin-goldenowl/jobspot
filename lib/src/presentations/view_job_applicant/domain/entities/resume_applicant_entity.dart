import 'package:jobspot/src/presentations/applicant_profile/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/connection/domain/entities/user_entity.dart';

class ResumeApplicantEntity {
  final String id;
  final String description;
  final bool? isAccept;
  final ResumeEntity resume;
  final UserEntity applicant;
  final DateTime createAt;

  ResumeApplicantEntity({
    required this.id,
    required this.description,
    required this.isAccept,
    required this.resume,
    required this.applicant,
    required this.createAt,
  });
}
