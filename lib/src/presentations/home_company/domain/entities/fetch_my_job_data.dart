import 'package:jobspot/src/presentations/home_company/domain/entities/my_job_entity.dart';

class FetchMyJobData {
  final List<MyJobEntity> jobs;
  final bool isMore;
  final int limit;

  FetchMyJobData({
    required this.isMore,
    required this.jobs,
    required this.limit,
  });
}
