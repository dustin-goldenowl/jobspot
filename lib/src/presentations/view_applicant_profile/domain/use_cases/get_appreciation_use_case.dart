import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/applicant_profile/domain/entities/appreciation_entity.dart';
import 'package:jobspot/src/presentations/view_applicant_profile/domain/repositories/view_applicant_profile_repository.dart';

@lazySingleton
class GetAppreciationUseCase
    extends UseCase<DataState<List<AppreciationEntity>>, String> {
  final ViewApplicantProfileRepository _repository;

  GetAppreciationUseCase(this._repository);

  @override
  Future<DataState<List<AppreciationEntity>>> call({required String params}) {
    return _repository.getAppreciation(params);
  }
}
