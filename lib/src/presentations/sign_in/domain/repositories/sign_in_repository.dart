import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/authentication_entity.dart';

abstract class SignInRepository {
  Future<DataState<UserCredential>> signInWithEmailPassword(
      AuthenticationEntity entity);

  Future<DataState<bool>> signInWithGoogle(GoogleSignInAccount googleUser);
}
