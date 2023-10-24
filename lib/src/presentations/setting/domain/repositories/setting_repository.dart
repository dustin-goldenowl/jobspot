import 'package:jobspot/src/core/resources/data_state.dart';

abstract class SettingRepository {
  Future<DataState<bool>> deleteAccount();
}
