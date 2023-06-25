class UserModel {
  final String? id;
  final String role;
  final String fullname;
  final String phoneNo;
  final String email;
  final String password;

  const UserModel(
      {this.id,
      required this.role,
      required this.fullname,
      required this.phoneNo,
      required this.email,
      required this.password});

  toJson() {
    return {
      "Role": role,
      "Fullname": fullname,
      "Phone No": phoneNo,
      "Email": email,
      "Password": password,
    };
  }
}
