import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
import 'package:jobspot/src/presentations/edit_company_profile/data/models/update_company_info_model.dart';
import 'package:jobspot/src/presentations/edit_company_profile/domain/entities/update_company_info_entity.dart';
import 'package:jobspot/src/presentations/edit_company_profile/domain/repositories/edit_company_profile_repository.dart';

@LazySingleton(as: EditCompanyProfileRepository)
class EditCompanyProfileRepositoryImpl extends EditCompanyProfileRepository {
  @override
  Future<DataState<bool>> updateUserInfo(UpdateCompanyInfoEntity info) async {
    try {
      UpdateCompanyInfoModel user = UpdateCompanyInfoModel.fromEntity(info);
      final uid = FirebaseAuth.instance.currentUser!.uid;
      for (var element in info.removeImages) {
        FirebaseUtils.deleteImage(element);
      }
      final images = await Future.wait([
        ...info.images.map((e) => FirebaseUtils.uploadImage(
            folder: "companyGallerys/$uid",
            name: DateTime.now().microsecondsSinceEpoch.toString(),
            image: e)),
        FirebaseUtils.uploadImage(
            folder: "users", name: uid, image: user.avatar),
      ]);
      user.avatar = images.last;
      images.removeLast();
      user.images = images;
      await XCollection.user.doc(uid).update(user.toJson());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
