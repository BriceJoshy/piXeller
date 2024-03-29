import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/features/authentication/screens/signinpage/widgets/signUpWidget.dart';
import '../../../../constants/image_strings.dart';

var size, height_mq, width_mq;

String selectedRole = "Role";
List<String> myList = ["Distributer", "Producer"];
String occupation = "";

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height_mq = size.height;
    width_mq = size.width;
    return Scaffold(
      backgroundColor: const Color(0xffd6e2ea),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.transparent,
              height: height_mq * 1.05,
              width: double.infinity,
            ),
            Positioned(
              child: Container(
                color: Colors.transparent,
                height: 820,
                width: double.infinity,
              ),
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
              left: 0,
              right: 0,
              child: Center(
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
            ),
            Positioned(
              top: 390,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  signUpWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future signInFunction() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  //   try {
  //     await APIs.auth.createUserWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (_) => homeScreen()));
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //   }
  // navigatorKey.currentState!.popUntil((route) {homeScreen();});
  // }
}
