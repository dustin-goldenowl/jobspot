import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/sign_up/data/models/register_applicant_model.dart';
import 'package:jobspot/src/presentations/sign_up/data/models/register_business_model.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_business_entity.dart';
import 'package:jobspot/src/presentations/sign_up/domain/repositories/sign_up_repository.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl extends SignUpRepository {
  @override
  Future<DataState<bool>> signUpApplicant(
      RegisterApplicantEntity entity) async {
    return signUpWithEmailPassword(
      email: entity.email,
      password: entity.password,
      data: RegisterApplicantModel.fromEntity(entity).toJson(),
    );
  }

  @override
  Future<DataState<bool>> signUpWithGoogle(
      GoogleSignInAccount googleUser) async {
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(googleCredential);
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> signUpBusiness(RegisterBusinessEntity entity) {
    return signUpWithEmailPassword(
      email: entity.email,
      password: entity.password,
      data: RegisterBusinessModel.fromEntity(entity).toJson(),
    );
  }

  Future<DataState<bool>> signUpWithEmailPassword({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await XCollection.user.doc(credential.user!.uid).set(data);
      return DataSuccess(true);
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
}
