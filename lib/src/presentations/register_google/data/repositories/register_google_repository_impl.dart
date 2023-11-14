import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/register_google/domain/repositories/register_google_repository.dart';
import 'package:jobspot/src/presentations/sign_up/data/models/register_applicant_model.dart';
import 'package:jobspot/src/presentations/sign_up/domain/entities/register_applicant_entity.dart';

@LazySingleton(as: RegisterGoogleRepository)
class RegisterGoogleRepositoryImpl extends RegisterGoogleRepository {
  @override
  Future<DataState<bool>> updateInfoUser(RegisterApplicantEntity entity) async {
    try {
      final myDoc =
          XCollection.user.doc(FirebaseAuth.instance.currentUser!.uid);
      await myDoc.set(RegisterApplicantModel.fromEntity(entity).toJson());
      final response = await myDoc.get();
      await PrefsUtils.saveUserInfo(
          UserModel.fromDocumentSnapshot(response).toJson());
      return const DataSuccess(true);
    } catch (e) {
      log(e.toString());
      return DataFailed(e.toString());
    }
  }
}
