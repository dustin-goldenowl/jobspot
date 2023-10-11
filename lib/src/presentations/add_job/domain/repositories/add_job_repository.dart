import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';

abstract class AddJobRepository {
  Future<DataState> addJob(JobEntity job);

  Future<DataState> updateJob(UpdateJobEntity job);
}
