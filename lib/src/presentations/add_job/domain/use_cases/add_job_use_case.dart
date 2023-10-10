import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart';

@lazySingleton
class AddJobUseCase extends UseCase<DataState, JobEntity> {
  AddJobUseCase(this._repository);

  final AddJobRepository _repository;

  @override
  Future<DataState> call({required JobEntity params}) {
    return _repository.addJob(params);
  }
}
