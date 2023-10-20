import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/add_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart';

@lazySingleton
class AddLanguageUseCase extends UseCase<DataState<bool>, AddLanguageEntity> {
  final LanguageRepository _repository;

  AddLanguageUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required AddLanguageEntity params}) {
    return _repository.addLanguage(params);
  }
}
