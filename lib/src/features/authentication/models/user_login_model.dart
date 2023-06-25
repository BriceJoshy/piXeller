class UserModel {
  final String? id;
  final occupation;
  final fullname;
  final email;
  final password;

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
