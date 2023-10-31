import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/edit_company_profile/domain/entities/update_company_info_entity.dart';
import 'package:jobspot/src/presentations/edit_company_profile/domain/repositories/edit_company_profile_repository.dart';

@lazySingleton
class UpdateCompanyInfoUseCase
    extends UseCase<DataState<bool>, UpdateCompanyInfoEntity> {
  final EditCompanyProfileRepository _repository;

  UpdateCompanyInfoUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required UpdateCompanyInfoEntity params}) {
    return _repository.updateUserInfo(params);
  }
}
