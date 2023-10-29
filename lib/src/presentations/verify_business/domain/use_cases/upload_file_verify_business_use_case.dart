import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/verify_business/domain/entities/verify_business_entity.dart';
import 'package:jobspot/src/presentations/verify_business/domain/repositories/verify_business_repository.dart';

@lazySingleton
class UploadFileVerifyBusinessUseCase
    extends UseCase<DataState<bool>, VerifyBusinessEntity> {
  final VerifyBusinessRepository _repository;

  UploadFileVerifyBusinessUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required VerifyBusinessEntity params}) {
    return _repository.uploadFileVerifyBusiness(params);
  }
}
