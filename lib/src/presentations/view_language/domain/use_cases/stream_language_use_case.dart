import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/stream_use_case.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';
import 'package:jobspot/src/presentations/view_language/domain/repositories/view_language_repository.dart';

@lazySingleton
class StreamLanguagesUseCase
    extends StreamUseCase<DataState<List<LanguageEntity>>, dynamic> {
  final ViewLanguageRepository _repository;

  StreamLanguagesUseCase(this._repository);

  @override
  Stream<DataState<List<LanguageEntity>>> call({params}) {
    return _repository.getLanguages();
  }
}
