import 'package:jobspot/src/core/resources/data_state.dart';

abstract class JobPositionRepository {
  Future<DataState<List<String>>> searchJobPosition(String query);
}
