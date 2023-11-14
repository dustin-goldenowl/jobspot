import 'package:injectable/injectable.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/service/firebase_collection.dart';
import 'package:jobspot/src/presentations/company_profile/domain/repositories/company_profile_repository.dart';

@LazySingleton(as: CompanyProfileRepository)
class CompanyProfileRepositoryImpl extends CompanyProfileRepository {
  @override
  Future<DataState<bool>> deleteJob(String id) async {
    try {
      await XCollection.job.doc(id).delete();
      return const DataSuccess(true);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
