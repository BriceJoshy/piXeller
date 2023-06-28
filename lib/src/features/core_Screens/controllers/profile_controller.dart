// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mini_project_1/src/repository/authentication_repository/authendication_repository.dart';
// import 'package:mini_project_1/src/features/authentication/models/user_login_model.dart';
// import 'package:mini_project_1/src/repository/user_repository/user_repositiry.dart';

// class ProfileController extends GetxController {
//   static ProfileController get instance => Get.find();

//   final _authRepo = Get.put(AuthenticationRepository());
//   // final _userRepo = Get.put(UserRepository());

//   getUserData() {
//     final email = _authRepo.firebaseUser.value?.email;
//     if (email != null) {
//       return _userRepo.getUserDetails(email);
//     } else
//       (Get.snackbar("Login", "Login to continue"));
//   }

//   updateRecord(AppUser user) async {
//     await _userRepo.updateUserRecord(user);
//   }
// }
