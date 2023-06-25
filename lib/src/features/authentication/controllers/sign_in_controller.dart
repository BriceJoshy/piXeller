import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final role = "";

  void registerUser(String email, String password) {}
}
