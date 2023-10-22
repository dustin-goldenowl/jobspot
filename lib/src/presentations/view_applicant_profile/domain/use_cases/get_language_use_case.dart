import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart';
import 'package:jobspot/src/presentations/view_language/domain/entities/language_entity.dart';

@lazySingleton
class GetLanguageUseCase
    extends UseCase<DataState<List<LanguageEntity>>, String> {
  final ViewApplicantProfileRepository _repository;

  GetLanguageUseCase(this._repository);

  @override
  Future<DataState<List<LanguageEntity>>> call({required String params}) {
    return _repository.getLanguages(params);
  }
}
