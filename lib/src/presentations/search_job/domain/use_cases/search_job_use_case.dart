import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_entity.dart';
import 'package:jobspot/src/presentations/search_job/domain/entity/search_job_data.dart';
import 'package:jobspot/src/presentations/search_job/domain/repositories/search_job_repository.dart';

@lazySingleton
class SearchJobUseCase extends UseCase<DataState<SearchJobData>, SearchEntity> {
  final SearchJobRepository _repository;

  SearchJobUseCase(this._repository);

  @override
  Future<DataState<SearchJobData>> call({required SearchEntity params}) {
    return _repository.searchJob(params);
  }
}
