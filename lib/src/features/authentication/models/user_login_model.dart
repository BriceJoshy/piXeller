class AppUser {
  AppUser({
    required this.id,
    required this.role,
    required this.userType,
    required this.fullname,
    required this.phoneNo,
    required this.email,
    required this.password,
    required this.image,
    required this.about,
    required this.createdAt,
  });
  late String id;
  late String role;
  late String userType;
  late String fullname;
  late String phoneNo;
  late String email;
  late String password;
  late String image;
  late String about;
  late String createdAt;

  AppUser.fromJson(Map<String, dynamic> json) {
    // if the value is null that is if not filled then return empty String ?? ''

    id = json['id'] ?? '';
    role = json['role'] ?? '';
    userType = json['userType'] ?? '';
    fullname = json['fullname'] ?? '';
    phoneNo = json['phoneNo'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
    image = json['image'] ?? '';
    about = json['about'] ?? '';
    createdAt = json['created_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    // no need to maje data private "_data"
    final data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['userType'] = userType;
    data['fullname'] = fullname;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['about'] = about;
    data['created_at'] = createdAt;
    return data;
  }
}
