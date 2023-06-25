// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_1/src/apis/api.dart';
import 'package:mini_project_1/src/features/authentication/screens/homescreen/homedrawerScreen/homedrawerScreen.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/animated_login_page.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/login_page.dart';
import 'package:mini_project_1/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';

import 'exceptions/signup_mail_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.put(AuthenticationRepository());

  final _auth = APIs.auth;
  late final Rx<User?> firebaseUser;

  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    _setInitialScreen(User? user) {
      user == null
          ? Get.offAll(() => AnimatedLoginForm())
          : Get.offAll(() => const HomeDrawerScreen());
    }

    ever(firebaseUser, _setInitialScreen);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // to redirect user
      firebaseUser.value != null
          ? Get.offAll(() => const HomeDrawerScreen())
          : Get.to(() => const onBoardingScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);

      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("EXCEPTION - ${ex.message}");
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
