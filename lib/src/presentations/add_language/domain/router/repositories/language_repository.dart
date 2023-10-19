import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_language/domain/router/entities/add_language_entity.dart';

abstract class LanguageRepository {
  Future<DataState<bool>> addLanguage(AddLanguageEntity language);
}
