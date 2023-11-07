import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/apply_job_entity.dart';

abstract class ApplyJobRepository {
  Future<DataState<String>> applyJob(ApplyJobEntity apply);
}
