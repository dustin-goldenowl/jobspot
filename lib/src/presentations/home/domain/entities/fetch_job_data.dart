import 'package:jobspot/src/presentations/home/data/models/job_model.dart';

class FetchJobData {
  //TODO finish project => JobModel to JobEntity
  List<JobModel> jobs;
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
