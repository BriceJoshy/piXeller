import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/image_strings.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd6e2ea),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              height: 820,
              width: double.infinity,
            ),
            Positioned(
              child: Container(
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(myLoginPageBackground),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            Positioned(
              left: 30,
              width: 80,
              height: 200,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(myLoginPageLight1),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 140,
              width: 80,
              height: 150,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(myLoginPageLight2),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 40,
              top: 40,
              width: 80,
              height: 150,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(myLoginPageClock),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 140,
              right: 10,
              child: Text(
                "Sign In",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.white,
                  fontSize: 45,
                  // fontWeight: FontWeight.bold
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      alignment: Alignment.center,
                      width: 400,
                      padding: const EdgeInsets.only(
                          top: 5, left: 5, right: 5, bottom: 10),
                      // margin: const EdgeInsets.only(bottom: 15 * 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade100),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontSize: 14),
                              cursorColor: const Color(0xffb04863),
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  // child: SvgPicture.asset(myLoginPageEmailIcon),
                                ),
                                border: InputBorder.none,
                                hintText: "Name",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade100),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontSize: 14),
                              cursorColor: const Color(0xffb04863),
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  // child: SvgPicture.asset(myLoginPageEmailIcon),
                                ),
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade100),
                              ),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              style: const TextStyle(fontSize: 14),
                              cursorColor: const Color(0xffb04863),
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  // child:
                                  //     SvgPicture.asset(myLoginPagePasswordIcon),
                                ),
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
