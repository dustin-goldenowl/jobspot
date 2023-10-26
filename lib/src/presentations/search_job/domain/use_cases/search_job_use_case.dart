import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@lazySingleton
class SearchJobUseCase
    extends UseCase<DataState<List<JobEntity>>, SearchEntity> {
  final SearchJobRepository _repository;

  SearchJobUseCase(this._repository);

  @override
  Future<DataState<List<JobEntity>>> call({required SearchEntity params}) {
    return _repository.searchJob(params);
  }
}
