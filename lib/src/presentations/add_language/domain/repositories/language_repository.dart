import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/add_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/update_language_entity.dart';

abstract class LanguageRepository {
  Future<DataState<bool>> addLanguage(AddLanguageEntity language);

  Future<DataState<bool>> updateLanguage(UpdateLanguageEntity language);

  Future<DataState<bool>> deleteLanguage(String id);
}
