import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/repositories/applicant_profile_repository.dart';

@lazySingleton
class UpdateAboutMeUseCase extends UseCase<DataState<bool>, String> {
  final ApplicantProfileRepository _repository;

  UpdateAboutMeUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required String params}) {
    return _repository.updateAboutMe(params);
  }
}
