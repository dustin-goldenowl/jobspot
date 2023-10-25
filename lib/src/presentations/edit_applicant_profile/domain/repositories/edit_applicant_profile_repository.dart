import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/entities/update_user_info_entity.dart';

abstract class EditApplicantProfileRepository {
  Future<DataState<bool>> updateUserInfo(UpdateUserInfoEntity info);
}
