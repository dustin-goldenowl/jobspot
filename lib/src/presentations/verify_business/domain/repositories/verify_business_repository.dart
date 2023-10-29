import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/verify_business/domain/entities/verify_business_entity.dart';

abstract class VerifyBusinessRepository {
  Future<DataState<bool>> uploadFileVerifyBusiness(VerifyBusinessEntity entity);
}
