class UserEntity {
  //general
  final String id;
  final String name;
  final String role;
  final String avatar;
  final String email;
  final DateTime birthday;
  final String address;
  final String description;
  final List<String> follower;
  final List<String> following;
  final DateTime updateAt;
  final DateTime createAt;

  //applicant
  final bool? gender;
  final List<String>? skill;
  final List<String>? saveJob;

  //business
  final bool? isAccept;
  final String? website;
  final String? industry;
  final String? employeeSize;
  final List<String>? images;
  final List<String>? specialization;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.address,
    required this.birthday,
    required this.description,
    required this.follower,
    required this.following,
    required this.updateAt,
    required this.createAt,
    required this.role,
    this.gender,
    this.skill,
    this.saveJob,
    this.employeeSize,
    this.images,
    this.industry,
    this.isAccept,
    this.specialization,
    this.website,
  });
}
