// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mini_project_1/src/apis/api.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/animated_login_page.dart';
import '../../features/core_Screens/homescreen/homedrawerScreen/homedrawerScreen.dart';
import '../../features/core_Screens/on_boarding/on_boarding_screen.dart';
import 'exceptions/signup_mail_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.put(AuthenticationRepository());

  final _auth = APIs.auth;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  // void onReady() {
  //   firebaseUser = Rx<User?>(_auth.currentUser);
  //   firebaseUser.bindStream(_auth.userChanges());
  //   // _setInitialScreen(User? user) {
  //   //   user == null
  //   //       ? Get.offAll(() => AnimatedLoginForm())
  //   //       : Get.offAll(() => const HomeDrawerScreen());
  //   // }

  //   // ever(firebaseUser, _setInitialScreen);
  // }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      //  passing the ph no to the query
      // verificationCompleted function is executed when the phone requesting is the same phone signing in
      //
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", "The provided phone number is not valid.");
        } else {
          Get.snackbar("Error", "Something went wrong. Try again.");
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // .then((value) => Get.to(() => HomeDrawerScreen()));
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

  Future<void> logout() async {
    await _auth.signOut().then((value) => Get.offAll(AnimatedLoginForm()));
  }
}
