import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_1/src/authentication_repository/authendication_repository.dart';

import '../screens/signinpage/widgets/signUpWidget.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final role = Dropdownvalue;

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(
        GetSnackBar(message: error.toString()),
      );
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
