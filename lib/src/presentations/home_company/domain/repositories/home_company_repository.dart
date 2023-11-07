import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/my_job_entity.dart';

abstract class HomeCompanyRepository {
  Future<DataState<FetchLazyData<MyJobEntity>>> getListMyJob(int limit);
}
