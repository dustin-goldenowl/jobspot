import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_job_data.dart';

abstract class SearchJobRepository {
  Future<DataState<SearchJobData>> searchJob(SearchEntity entity);
}
