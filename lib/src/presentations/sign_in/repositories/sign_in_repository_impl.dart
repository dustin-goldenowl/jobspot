import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/email_password_entity.dart';
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

@LazySingleton(as: SignInRepository)
class LoginRepositoryImpl extends SignInRepository {
  @override
  Future<DataState<UserCredential>> signInWithEmailPassword(
      EmailPasswordEntity entity) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: entity.email,
        password: entity.password,
      );
      return DataSuccess(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return DataFailed('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return DataFailed('The account already exists for that email.');
      }
      return DataFailed(e.toString());
    } catch (e) {
      print(e);
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<UserCredential>> signInWithGoogle(
      GoogleSignInAccount googleUser) async {
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return DataSuccess(
        await FirebaseAuth.instance.signInWithCredential(credential),
      );
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
