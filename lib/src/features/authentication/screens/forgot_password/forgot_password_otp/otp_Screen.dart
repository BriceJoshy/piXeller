import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                forgotPasswordOTPicon,
                height: 200,
                width: 200,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
