import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home/domain/entities/fetch_job_data.dart';

abstract class HomeRepository {
  Stream<DataState<FetchJobData>> fetchJobData();
}
