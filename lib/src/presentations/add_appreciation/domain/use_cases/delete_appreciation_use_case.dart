import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart';

@lazySingleton
class DeleteAppreciationUseCase extends UseCase<DataState<bool>, String> {
  final AppreciationRepository _repository;

  DeleteAppreciationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteAppreciation(params);
  }
}
