import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/entities/consider_resume.dart';
import 'package:jobspot/src/presentations/view_job_applicant/domain/repositories/view_job_applicant_repository.dart';

@lazySingleton
class ConsiderResumeUseCase extends UseCase<DataState<bool>, ConsiderResume> {
  final ViewJobApplicantRepository _repository;

  ConsiderResumeUseCase(this._repository);

  @override
  Future<DataState<bool>> call({required ConsiderResume params}) {
    return _repository.considerResume(params);
  }
}
