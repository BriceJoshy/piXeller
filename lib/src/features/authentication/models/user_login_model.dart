class UserModel {
  final String? id;
  final role;
  final fullname;
  final phoneNo;
  final email;
  final password;

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
