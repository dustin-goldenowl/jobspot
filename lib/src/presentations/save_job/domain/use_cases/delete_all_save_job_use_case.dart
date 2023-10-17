import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart';

@lazySingleton
class DeleteAllSaveJobUseCase extends UseCase<DataState<bool>, dynamic> {
  final SaveJobRepository _repository;

  DeleteAllSaveJobUseCase(this._repository);

  @override
  Future<DataState<bool>> call({params}) {
    return _repository.deleteAllSaveJob();
  }
}
