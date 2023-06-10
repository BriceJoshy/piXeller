import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/animated_login_page.dart';

class MyAnimatedButton extends StatelessWidget {
  const MyAnimatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      height: 67,
      width: 200,
      borderRadius: 20,
      onPress: () {
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            showGeneralDialog(
              barrierDismissible: true,
              barrierLabel: "Login Or Sign In",
              context: context,
              pageBuilder: (context, _, __) => Center(
                child: Container(
                  height: 500,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.orange,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 30),
                            child: Text(
                              "Connecting Producers and Distributors for Greater Opportunities and Increased Income!",
                              style: GoogleFonts.poppins(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 56),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AnimatedLoginForm()));
                            },
                            icon: Image.asset(
                              myWelcomePageLoginGif,
                              height: 35,
                              width: 35,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Row(
                              children: [
                                const Expanded(child: Divider()),
                                Text(
                                  "OR",
                                  style:
                                      GoogleFonts.poppins(color: Colors.black),
                                ),
                                const Expanded(child: Divider())
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 56),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: Image.asset(
                              myWelcomePageSigninGIf,
                              height: 35,
                              width: 35,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Sign In",
                              style: GoogleFonts.poppins(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      text: 'Join Now',
      selectedTextColor: Colors.black,
      textStyle: GoogleFonts.poppins(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      backgroundColor: Colors.black,
    );
  }
}
