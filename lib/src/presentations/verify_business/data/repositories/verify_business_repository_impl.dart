import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/core/utils/firebase_utils.dart';
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
      await XCollection.verifyBusiness.doc().set(model.toJson());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
