import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/view_language/data/models/language_model.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart';

@LazySingleton(as: ViewLanguageRepository)
class ViewLanguageRepositoryImpl extends ViewLanguageRepository {
  @override
  Stream<DataState<List<LanguageEntity>>> getLanguages() {
    try {
      return XCollection.language
          .where("owner", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .asyncMap((event) {
        List<LanguageModel> listLang = event.docs
            .map((e) => LanguageModel.fromDocumentSnapshot(e))
            .toList();
        final model = listLang.where((element) => element.isFirst).toList();
        if (model.isNotEmpty) {
          listLang.removeWhere((element) => element.isFirst);
          listLang.insert(0, model.first);
        }
        return DataSuccess(listLang.map((e) => e.toLanguageEntity()).toList());
      });
    } catch (e) {
      return Stream.value(DataFailed(e.toString()));
    }
  }
}
