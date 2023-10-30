enum UserRole { admin, business, applicant }

UserRole getUserRole(String role) {
  switch (role) {
    case "admin":
      return UserRole.admin;
    case "business":
      return UserRole.business;
    default:
      return UserRole.applicant;
  }
}
