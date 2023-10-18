import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/update_appreciation_entity.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart';

@lazySingleton
class UpdateAppreciationUseCase
    extends UseCase<DataState<bool>, UpdateAppreciationEntity> {
  final AppreciationRepository _repository;

  UpdateAppreciationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required UpdateAppreciationEntity params}) {
    return _repository.updateAppreciation(params);
  }
}
