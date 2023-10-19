import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
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
        final response = await FirebaseFirestore.instance
            .collection("languages")
            .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where("isFirst", isEqualTo: true)
            .get();
        await Future.wait(response.docs
            .map((e) => FirebaseFirestore.instance
                .collection("languages")
                .doc(e.id)
                .update({"isFirst": false}))
            .toList());
      }
      await FirebaseFirestore.instance
          .collection("languages")
          .doc()
          .set(AddLanguageModel.fromEntity(language).toJson());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> updateLanguage(UpdateLanguageEntity language) async {
    try {
      if (language.isFirst) {
        final response = await FirebaseFirestore.instance
            .collection("languages")
            .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where("isFirst", isEqualTo: true)
            .get();
        await Future.wait(response.docs
            .map((e) => FirebaseFirestore.instance
                .collection("languages")
                .doc(e.id)
                .update({"isFirst": false}))
            .toList());
      }
      await FirebaseFirestore.instance
          .collection("languages")
          .doc(language.id)
          .update(UpdateLanguageModel.fromEntity(language).toJson());
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<bool>> deleteLanguage(String id) async {
    try {
      await FirebaseFirestore.instance.collection("languages").doc(id).delete();
      return DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
