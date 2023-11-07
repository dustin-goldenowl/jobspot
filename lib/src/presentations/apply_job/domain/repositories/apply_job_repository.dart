import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/resume_entity.dart';

abstract class ApplyJobRepository {
  Future<DataState<String>> applyJob(ResumeEntity resume);
}
