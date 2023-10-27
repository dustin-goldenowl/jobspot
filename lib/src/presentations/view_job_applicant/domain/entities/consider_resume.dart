import 'package:jobspot/src/core/enum/application_status.dart';

class ConsiderResume {
  final String applyID;
  final ApplicationStatus status;
  final String jobID;
  final String toUserID;

  ConsiderResume({
    required this.applyID,
    required this.status,
    required this.jobID,
    required this.toUserID,
  });
}
