import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/view_job/domain/repositories/view_job_repository.dart';

@lazySingleton
class FetchJobUseCase extends UseCase<DataState<JobEntity>, String> {
  FetchJobUseCase(this._repository);

  final ViewJobRepository _repository;

  @override
  Future<DataState<JobEntity>> call({required String params}) {
    return _repository.getJobData(params);
  }
}
