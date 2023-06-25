import 'package:get/get.dart';
import 'package:mini_project_1/src/authentication_repository/authendication_repository.dart';

import '../../core/homescreen/homedrawerScreen/homedrawerScreen.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.put(OTPController());
  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified
        ? Get.offAll(() => const HomeDrawerScreen())
        : Get.showSnackbar(GetSnackBar(
            message: "Otp verification failed!",
          ));
  }
}
