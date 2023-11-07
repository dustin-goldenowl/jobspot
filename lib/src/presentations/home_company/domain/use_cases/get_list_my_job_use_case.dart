import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/core/resources/use_case.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/my_job_entity.dart';
import 'package:jobspot/src/presentations/home_company/domain/repositories/home_company_repository.dart';

@lazySingleton
class GetListMyJobUseCase
    extends UseCase<DataState<FetchLazyData<MyJobEntity>>, int> {
  final HomeCompanyRepository _repository;

  GetListMyJobUseCase(this._repository);

  @override
  Future<DataState<FetchLazyData<MyJobEntity>>> call({required int params}) {
    return _repository.getListMyJob(params);
  }
}
