import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/add_appreciation_entity.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/repositories/appreciation_repository.dart';

@lazySingleton
class AddAppreciationUseCase
    extends UseCase<DataState<bool>, AddAppreciationEntity> {
  final AppreciationRepository _repository;

  AddAppreciationUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required AddAppreciationEntity params}) {
    return _repository.addAppreciation(params);
  }
}
