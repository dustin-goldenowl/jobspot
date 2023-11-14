import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/add_language/data/models/add_language_model.dart';
import 'package:jobspot/src/presentations/add_language/data/models/update_language_model.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/add_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/update_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl extends LanguageRepository {
  @override
  Future<DataState<bool>> addLanguage(AddLanguageEntity language) async {
    try {
      if (language.isFirst) {
        final response = await XCollection.language
            .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where("isFirst", isEqualTo: true)
            .get();
        await Future.wait(response.docs
            .map((e) =>
                XCollection.language.doc(e.id).update({"isFirst": false}))
            .toList());
      }
      await XCollection.language
          .doc()
          .set(AddLanguageModel.fromEntity(language).toJson());
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateLanguage(UpdateLanguageEntity language) async {
    try {
      if (language.isFirst) {
        final response = await XCollection.language
            .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where("isFirst", isEqualTo: true)
            .get();
        await Future.wait(response.docs
            .map((e) =>
                XCollection.language.doc(e.id).update({"isFirst": false}))
            .toList());
      }
      await XCollection.language
          .doc(language.id)
          .update(UpdateLanguageModel.fromEntity(language).toJson());
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteLanguage(String id) async {
    try {
      await XCollection.language.doc(id).delete();
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
