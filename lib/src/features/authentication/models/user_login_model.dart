class UserModel {
  final String? id;
  final String occupation;
  final String fullname;
  final String email;
  final String password;

  const UserModel(
      {this.id,
      required this.occupation,
      required this.fullname,
      required this.email,
      required this.password});

  toJson() {
    return {
      "Occupation": occupation,
      "Fullname": fullname,
      "Email": email,
      "Password": password,
    };
  }
}
