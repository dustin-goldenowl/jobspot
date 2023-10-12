import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/cv_entity.dart';

abstract class ApplyJobRepository {
  Future<DataState<bool>> applyJob(CVEntity cv);
}
