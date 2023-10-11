import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/update_job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart';

@injectable
class UpdateJobUseCase extends UseCase<DataState, UpdateJobEntity> {
  UpdateJobUseCase(this._repository);

  final AddJobRepository _repository;

  @override
  Future<DataState> call({required UpdateJobEntity params}) {
    return _repository.updateJob(params);
  }
}
