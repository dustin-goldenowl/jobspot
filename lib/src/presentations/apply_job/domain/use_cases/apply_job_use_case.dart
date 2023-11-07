import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/apply_job/domain/entities/resume_entity.dart';
import 'package:jobspot/src/presentations/apply_job/domain/repositories/apply_job_repository.dart';

@lazySingleton
class ApplyJobUseCase extends UseCase<DataState<String>, ResumeEntity> {
  final ApplyJobRepository _repository;

  ApplyJobUseCase(this._repository);

  @override
  Future<DataState<String>> call({required ResumeEntity params}) {
    return _repository.applyJob(params);
  }
}
