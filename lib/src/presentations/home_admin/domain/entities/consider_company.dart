import 'package:jobspot/src/core/enum/verify_status.dart';

class ConsiderCompany {
  final VerifyStatus status;
  final String toUserID;

  ConsiderCompany({
    required this.status,
    required this.toUserID,
  });
}
