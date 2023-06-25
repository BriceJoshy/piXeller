import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_Screen.dart';

import '../forgot_password_email/forgt_password_mail.dart';
import 'forgetPasswordBtnWidget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Make Selection!",
              style: GoogleFonts.poppins(
                  fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              "Select one of the options given below to rest your password.",
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mail_outlined,
              title: 'E-mail',
              subTitle: 'Reset via E-Mail Verification',
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: 'Phone No',
              subTitle: 'Reset via Phone Verification',
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const OTPScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
