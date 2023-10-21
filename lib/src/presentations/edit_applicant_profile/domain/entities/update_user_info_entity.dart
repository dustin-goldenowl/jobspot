class UpdateUserInfoEntity {
  final String avatar;
  final String name;
  final String address;
  final bool gender;
  final DateTime birthday;

  UpdateUserInfoEntity({
    required this.avatar,
    required this.name,
    required this.address,
    required this.birthday,
    required this.gender,
  });
}
