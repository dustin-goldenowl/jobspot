import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/entities/update_user_info_entity.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/repositories/edit_applicant_profile_repository.dart';

@lazySingleton
class UpdateUserInfoUseCase
    extends UseCase<DataState<bool>, UpdateUserInfoEntity> {
  final EditApplicantProfileRepository _repository;

  UpdateUserInfoUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required UpdateUserInfoEntity params}) {
    return _repository.updateUserInfo(params);
  }
}
