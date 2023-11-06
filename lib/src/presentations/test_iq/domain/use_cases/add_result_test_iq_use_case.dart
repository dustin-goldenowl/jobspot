import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/test_iq/domain/entities/add_result_test_iq_entity.dart';
import 'package:jobspot/src/presentations/test_iq/domain/repositories/test_iq_repository.dart';

@lazySingleton
class AddResultTestIQUseCase
    extends UseCase<DataState<bool>, AddResultTestIQEntity> {
  final TestIQRepository _repository;

  AddResultTestIQUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required AddResultTestIQEntity params}) {
    return _repository.addResultIQTest(params);
  }
}
