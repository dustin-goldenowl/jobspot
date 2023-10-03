class RegisterApplicantEntity {
  final String fullname;
  final String email;
  final String password;
  final bool gender;
  final DateTime birthday;

  RegisterApplicantEntity({
    required this.fullname,
    required this.email,
    required this.password,
    required this.gender,
    required this.birthday,
  });
}
