import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/register_google/domain/repositories/register_google_repository.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';

@lazySingleton
class UpdateInfoUserUseCase
    extends UseCase<DataState<bool>, RegisterApplicantEntity> {
  final RegisterGoogleRepository _repository;

  UpdateInfoUserUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required RegisterApplicantEntity params}) {
    return _repository.updateInfoUser(params);
  }
}
