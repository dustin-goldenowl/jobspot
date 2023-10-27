import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

class SearchJobData {
  final bool isMore;
  final int limit;
  final List<JobEntity> listJob;

  SearchJobData({
    required this.isMore,
    required this.limit,
    required this.listJob,
  });
}
