import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

abstract class SearchJobRepository {
  Future<DataState<List<JobEntity>>> searchJob(SearchEntity entity);
}
