import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  forgotPasswordOTPicon,
                  height: 130,
                  width: 130,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "OTP",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Verification".toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter the verification code sent at bricejoshy@99gmail.com",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code) {
                    // ignore: avoid_print
                    print("OTP is $code");
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.black87,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
