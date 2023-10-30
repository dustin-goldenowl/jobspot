import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';

abstract class RegisterGoogleRepository {
  Future<DataState<bool>> updateInfoUser(RegisterApplicantEntity entity);
}
