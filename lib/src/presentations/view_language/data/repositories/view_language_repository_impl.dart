import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_language/data/models/language_model.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart';

@LazySingleton(as: ViewLanguageRepository)
class ViewLanguageRepositoryImpl extends ViewLanguageRepository {
  @override
  Stream<DataState<List<LanguageEntity>>> getLanguages() {
    try {
      return FirebaseFirestore.instance
          .collection("languages")
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) {
        return DataSuccess(event.docs
            .map(
                (e) => LanguageModel.fromDocumentSnapshot(e).toLanguageEntity())
            .toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }
}
