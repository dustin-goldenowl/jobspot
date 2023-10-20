import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/add_appreciation_entity.dart';
import 'package:jobspot/src/presentations/add_appreciation/domain/entities/update_appreciation_entity.dart';

abstract class AppreciationRepository {
  Future<DataState<bool>> addAppreciation(AddAppreciationEntity appreciation);

  Future<DataState<bool>> updateAppreciation(
      UpdateAppreciationEntity appreciation);

  Future<DataState<bool>> deleteAppreciation(String id);
}
