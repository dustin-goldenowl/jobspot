class RegisterBussinessEntity {
  final String name;
  final String email;
  final String password;
  final DateTime founding;
  final String headquarters;
  final String employeeSize;

  RegisterBussinessEntity({
    required this.email,
    required this.name,
    required this.employeeSize,
    required this.founding,
    required this.headquarters,
    required this.password,
  });
}
