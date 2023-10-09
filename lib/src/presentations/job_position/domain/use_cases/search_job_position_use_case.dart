import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/job_position/domain/repositories/job_position_repository.dart';

@injectable
class SearchJobPositionUseCase
    extends UseCase<DataState<List<String>>, String> {
  SearchJobPositionUseCase(this._repository);

  final JobPositionRepository _repository;

  @override
  Future<DataState<List<String>>> call({required String params}) {
    return _repository.searchJobPosition(params);
  }
}
