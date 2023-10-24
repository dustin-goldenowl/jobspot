import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/sign_in/domain/entities/authentication_entity.dart';
import 'package:jobspot/src/presentations/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

@LazySingleton(as: SignInRepository)
class LoginRepositoryImpl extends SignInRepository {
  @override
  Future<DataState<UserCredential>> signInWithEmailPassword(
      AuthenticationEntity entity) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: entity.email,
        password: entity.password,
      );
      await saveUserInfo(credential.user!.uid);
      return DataSuccess(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return DataFailed('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return DataFailed('Wrong password provided for that user.');
      }
      return DataFailed(e.message ?? e.toString());
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<UserCredential>> signInWithGoogle(
      GoogleSignInAccount googleUser) async {
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final credential =
          await FirebaseAuth.instance.signInWithCredential(googleCredential);
      await saveUserInfo(credential.user!.uid);
      return DataSuccess(credential);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  Future saveUserInfo(String userUid) async {
    await XCollection.user.doc(userUid).get().then((value) async {
      if (value.data() != null) {
        await PrefsUtils.saveUserInfo(
            UserModel.fromJsonFirebase(value.data()!).toJson());
      }
    });
  }
}
