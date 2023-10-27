import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/fetch_my_job_data.dart';

abstract class HomeCompanyRepository {
  Future<DataState<FetchMyJobData>> getListMyJob(int limit);
}
