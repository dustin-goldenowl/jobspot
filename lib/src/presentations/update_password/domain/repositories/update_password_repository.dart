import 'package:jobspot/src/core/resources/data_state.dart';

abstract class UpdatePasswordRepository {
  Future<DataState<bool>> changePassword(String newPassword);

  Future<DataState<bool>> validatePassword(String oldPassword);
}
