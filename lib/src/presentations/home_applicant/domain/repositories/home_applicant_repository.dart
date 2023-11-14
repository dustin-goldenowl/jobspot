import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/home_applicant/domain/entities/fetch_job_data.dart';
import 'package:jobspot/src/presentations/view_job/data/models/company_model.dart';

abstract class HomeApplicantRepository {
  Stream<DataState<FetchJobData>> fetchJobData();

  Future<DataState<bool>> saveJob(String jobID);

  Future<List<CompanyModel>> getListCompany(Set<String> listID);
}
