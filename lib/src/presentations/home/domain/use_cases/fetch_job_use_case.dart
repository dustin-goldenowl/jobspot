import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/home/domain/entities/fetch_job_data.dart';
import 'package:jobspot/src/presentations/home/domain/repositories/home_repository.dart';

@lazySingleton
class FetchJobUseCase extends StreamUseCase<DataState<FetchJobData>, dynamic> {
  final HomeRepository _repository;

  FetchJobUseCase(this._repository);

  @override
  Stream<DataState<FetchJobData>> call({params}) {
    return _repository.fetchJobData();
  }
}
