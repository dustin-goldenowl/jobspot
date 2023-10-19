import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/data/models/add_language_model.dart';
import 'package:jobspot/src/presentations/add_language/domain/router/entities/add_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/domain/router/repositories/language_repository.dart';

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
}
