import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/save_job/domain/repositories/save_job_repository.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@lazySingleton
class ListenSaveJobUseCase
    extends StreamUseCase<DataState<List<JobEntity>>, dynamic> {
  final SaveJobRepository _repository;

  ListenSaveJobUseCase(this._repository);

  @override
  Stream<DataState<List<JobEntity>>> call({params}) {
    return _repository.listenSaveJob();
  }
}
