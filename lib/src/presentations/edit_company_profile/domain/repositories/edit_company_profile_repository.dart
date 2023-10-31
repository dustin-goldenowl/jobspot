import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/edit_company_profile/domain/entities/update_company_info_entity.dart';

abstract class EditCompanyProfileRepository {
  Future<DataState<bool>> updateUserInfo(UpdateCompanyInfoEntity info);
}
