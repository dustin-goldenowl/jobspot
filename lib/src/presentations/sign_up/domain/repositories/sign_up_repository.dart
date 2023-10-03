import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_bussiness_entity.dart';

abstract class SignUpRepository {
  Future<DataState<UserCredential>> signUpApplicant(
      RegisterApplicantEntity entity);

  Future<DataState<UserCredential>> signUpBussiness(
      RegisterBussinessEntity entity);

  Future<DataState<UserCredential>> signUpWithGoogle(
      GoogleSignInAccount googleUser);
}
