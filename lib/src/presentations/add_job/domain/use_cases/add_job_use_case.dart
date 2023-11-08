import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_job/domain/entities/add_job_entity.dart';
import 'package:jobspot/src/presentations/add_job/domain/repositories/add_job_repository.dart';

@lazySingleton
class AddJobUseCase extends UseCase<DataState, AddJobEntity> {
  AddJobUseCase(this._repository);

  final AddJobRepository _repository;

  @override
  Future<DataState> call({required AddJobEntity params}) {
    return _repository.addJob(params);
  }
}
