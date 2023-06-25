import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_1/src/authentication_repository/authendication_repository.dart';
import 'package:mini_project_1/src/features/authentication/models/user_login_model.dart';
import 'package:mini_project_1/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_Screen.dart';
import 'package:mini_project_1/src/user_repository/user_repositiry.dart';

import '../screens/signinpage/widgets/signUpWidget.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final role = Dropdownvalue;

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(
        GetSnackBar(message: error.toString()),
      );
    }
  }

  // Get phone no from user and pass it to auth repository for fireabase authentication
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
