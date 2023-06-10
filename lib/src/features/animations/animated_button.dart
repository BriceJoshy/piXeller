import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/login_page%20copy.dart';
import 'package:mini_project_1/src/features/authentication/screens/login_page/login_page.dart';

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
                                backgroundColor: Color(0xfff77d8e),
                                minimumSize: Size(double.infinity, 56)),
                            onPressed: () {},
                            icon: Image.asset("name"),
                            label: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  fontSize: 34, fontWeight: FontWeight.w700),
                            ),
                          )
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
      textStyle: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      transitionType: TransitionType.CENTER_ROUNDER,
      selectedGradientColor:
          const LinearGradient(colors: [Color(0xffDB308D), Color(0xffFFBB5C)]),
    );
  }
}
