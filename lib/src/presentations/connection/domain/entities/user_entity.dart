import 'package:jobspot/src/core/enum/user_role.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';

class UserEntity {
  final String id;
  final String name;
  final String avatar;
  final String address;
  final UserRole role;
  final VerifyStatus? verify;

  UserEntity({
    required this.id,
    required this.name,
    required this.avatar,
    required this.address,
    required this.role,
    this.verify,
  });
}
