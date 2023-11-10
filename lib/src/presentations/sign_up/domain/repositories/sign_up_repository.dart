import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_business_entity.dart';

abstract class SignUpRepository {
  Future<DataState<bool>> signUpApplicant(RegisterApplicantEntity entity);

  Future<DataState<bool>> signUpBusiness(RegisterBusinessEntity entity);

  Future<DataState<bool>> signUpWithGoogle(GoogleSignInAccount googleUser);
}
