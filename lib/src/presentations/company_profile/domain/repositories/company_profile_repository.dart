import 'package:jobspot/src/core/resources/data_state.dart';

abstract class CompanyProfileRepository {
  Future<DataState<bool>> deleteJob(String id);
}
