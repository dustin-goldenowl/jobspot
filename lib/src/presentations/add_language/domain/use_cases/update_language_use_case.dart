import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_language/domain/entities/update_language_entity.dart';
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart';

@lazySingleton
class UpdateLanguageUseCase
    extends UseCase<DataState<bool>, UpdateLanguageEntity> {
  final LanguageRepository _repository;

  UpdateLanguageUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required UpdateLanguageEntity params}) {
    return _repository.updateLanguage(params);
  }
}
