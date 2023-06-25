import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Image.asset(
                  forgotPasswordMailScreenicon,
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Forget Password",
                  style: GoogleFonts.poppins(
                      fontSize: 27, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Select one of the options given below to reset your password.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(25),
                            labelText: "Email",
                            prefixIcon: Icon(Icons.mail, color: Colors.black),
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.black))
                            // iconColor: Colors.black),
                            ),
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
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
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
