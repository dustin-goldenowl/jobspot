import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';
import 'package:jobspot/src/data/entities/user_entity.dart';
import 'package:jobspot/src/data/models/user_model.dart';
import 'package:jobspot/src/presentations/verify_business/data/models/verify_business_model.dart';
import 'package:jobspot/src/presentations/verify_business/domain/entities/verify_business_entity.dart';
import 'package:jobspot/src/presentations/verify_business/domain/repositories/verify_business_repository.dart';

@LazySingleton(as: VerifyBusinessRepository)
class VerifyBusinessRepositoryImpl extends VerifyBusinessRepository {
  @override
  Future<DataState<bool>> uploadFileVerifyBusiness(
      VerifyBusinessEntity entity) async {
    try {
      final link = await FirebaseUtils.uploadImage(
        folder: "verifyBusiness",
        name: DateTime.now().microsecondsSinceEpoch.toString(),
        image: entity.file.path!,
      );
      final model = VerifyBusinessModel.fromEntity(entity)..link = link;
      UserEntity? user = PrefsUtils.getUserInfo();
      if (user != null) {
        UserModel userModel = UserModel.fromEntity(user);
        userModel.verify = VerifyStatus.pending;
        PrefsUtils.saveUserInfo(userModel.toJson());
      }
      await Future.wait([
        XCollection.verifyBusiness.doc().set(model.toJson()),
        XCollection.user
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"verify": VerifyStatus.pending.name}),
      ]);
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
