import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/resume_applicant_entity.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/repositories/view_job_applicant_repository.dart';

@lazySingleton
class GetListApplicantUseCase
    extends UseCase<DataState<List<ResumeApplicantEntity>>, String> {
  final ViewJobApplicantRepository _repository;

  GetListApplicantUseCase(this._repository);

  @override
  Future<DataState<List<ResumeApplicantEntity>>> call(
      {required String params}) {
    return _repository.getListApplicant(params);
  }
}
