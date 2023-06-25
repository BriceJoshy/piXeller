import 'package:cloud_firestore/cloud_firestore.dart';

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

  /// Step 1-Map user fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    // fetch the data
    final data = document.data()!;
    return UserModel(
      id: document.id,
      role: data["Role"],
      fullname: data["Fullname"],
      phoneNo: data["Phone No"],
      email: data["Email"],
      password: data["Password"],
    );
  }
}
