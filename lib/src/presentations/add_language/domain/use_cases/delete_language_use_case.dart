import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/add_language/domain/repositories/language_repository.dart';

@lazySingleton
class DeleteLanguageUseCase extends UseCase<DataState<bool>, String> {
  final LanguageRepository _repository;

  DeleteLanguageUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.deleteLanguage(params);
  }
}
