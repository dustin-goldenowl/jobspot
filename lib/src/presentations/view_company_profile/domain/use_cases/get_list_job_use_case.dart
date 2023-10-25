import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/view_company_profile/domain/repositories/view_company_profile_repository.dart';
import 'package:jobspot/src/presentations/view_job/domain/entities/job_entity.dart';

@lazySingleton
class GetListJobUseCase extends UseCase<DataState<List<JobEntity>>, String> {
  final ViewCompanyProfileRepository _repository;

  GetListJobUseCase(this._repository);

  @override
  Future<DataState<List<JobEntity>>> call({required String params}) {
    return _repository.getListJob(params);
  }
}
