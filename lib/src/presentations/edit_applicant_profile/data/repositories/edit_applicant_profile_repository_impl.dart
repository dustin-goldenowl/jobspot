import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/data/models/update_user_info_model.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/entities/update_user_info_entity.dart';
import 'package:jobspot/src/presentations/edit_applicant_profile/domain/repositories/edit_applicant_profile_repository.dart';

@LazySingleton(as: EditApplicantProfileRepository)
class EditApplicantProfileRepositoryImpl
    extends EditApplicantProfileRepository {
  @override
  Future<DataState<bool>> updateUserInfo(UpdateUserInfoEntity info) async {
    try {
      UpdateUserInfoModel user = UpdateUserInfoModel.fromEntity(info);
      final uid = FirebaseAuth.instance.currentUser!.uid;
      user.avatar = await FirebaseUtils.uploadImage(
          folder: "users", name: uid, image: user.avatar);
      await XCollection.user.doc(uid).update(user.toJson());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
