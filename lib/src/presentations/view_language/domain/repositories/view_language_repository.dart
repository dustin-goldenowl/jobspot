import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';

abstract class ViewLanguageRepository {
  Stream<DataState<List<LanguageEntity>>> getLanguages();
}
