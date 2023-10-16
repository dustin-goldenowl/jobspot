import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class FetchJobData {
  List<JobEntity> jobs;
  int remote;
  int fulltime;
  int parttime;

  FetchJobData({
    required this.jobs,
    required this.fulltime,
    required this.parttime,
    required this.remote,
  });
}
