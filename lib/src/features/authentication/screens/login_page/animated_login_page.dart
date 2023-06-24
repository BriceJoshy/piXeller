import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/apis/api.dart';
import 'package:mini_project_1/src/features/authentication/screens/homescreen/homedrawerScreen/homedrawerScreen.dart';
import 'package:mini_project_1/src/features/authentication/screens/signinpage/signinpage.dart';
import 'package:rive/rive.dart';
import '../../../../constants/image_strings.dart';

class AnimatedLoginForm extends StatefulWidget {
  AnimatedLoginForm({Key? key}) : super(key: key);

  @override
  State<AnimatedLoginForm> createState() => _AnimatedLoginFormState();
}

class _AnimatedLoginFormState extends State<AnimatedLoginForm> {
  late String animationURL;
  Artboard? _teddyArtboard;
  SMITrigger? successTrigger, failTrigger;
  SMIBool? isHandsUp, isChecking;
  SMINumber? numLook;

  StateMachineController? stateMachineController;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    animationURL = defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? myLoginPageBearAnimation
        : myLoginPageBearAnimation;
    rootBundle.load(animationURL).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        stateMachineController =
            StateMachineController.fromArtboard(artboard, "Login Machine");
        if (stateMachineController != null) {
          artboard.addController(stateMachineController!);

          stateMachineController!.inputs.forEach((e) {
            debugPrint(e.runtimeType.toString());
            debugPrint("name${e.name}End");
          });

          stateMachineController!.inputs.forEach((element) {
            if (element.name == "trigSuccess") {
              successTrigger = element as SMITrigger;
            } else if (element.name == "trigFail") {
              failTrigger = element as SMITrigger;
            } else if (element.name == "isHandsUp") {
              isHandsUp = element as SMIBool;
            } else if (element.name == "isChecking") {
              isChecking = element as SMIBool;
            } else if (element.name == "numLook") {
              numLook = element as SMINumber;
            }
          });
        }

        setState(() => _teddyArtboard = artboard);
      },
    );
  }

  void handsOnTheEyes() {
    isHandsUp?.change(true);
  }

  void lookOnTheTextField() {
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBalls(val) {
    numLook?.change(val.length.toDouble());
  }

  // void login() {
  //   isChecking?.change(false);
  //   isHandsUp?.change(false);
  //   if (emailController.text == "admin" && passwordController.text == "admin") {
  //     successTrigger?.fire();
  //   } else {
  //     failTrigger?.fire();
  //   }
  // }

  void loginFailed() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    failTrigger?.fire();
  }

  void loginSuccess() {
    isChecking?.change(false);
    isHandsUp?.change(false);
    successTrigger?.fire();
  }

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
              top: 200,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Welcome Back!",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: Colors.white,
                    fontSize: 40,
                    // fontWeight: FontWeight.bold
                  ),
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
                  if (_teddyArtboard != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 350,
                        height: 300,
                        child: Rive(
                          artboard: _teddyArtboard!,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
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
                              controller: emailController,
                              onTap: lookOnTheTextField,
                              onChanged: moveEyeBalls,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(fontSize: 14),
                              cursorColor: const Color(0xffb04863),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: SvgPicture.asset(myLoginPageEmailIcon),
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
                              controller: passwordController,
                              onTap: handsOnTheEyes,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              style: const TextStyle(fontSize: 14),
                              cursorColor: const Color(0xffb04863),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child:
                                      SvgPicture.asset(myLoginPagePasswordIcon),
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
                    onTap: () {
                      loginSuccess();
                      loginFunction();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 50,
                        width: 400,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 16),
                      children: [
                        const TextSpan(text: "Don't have an Account? "),
                        TextSpan(
                          text: "SignIn",
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future loginFunction() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await APIs.auth
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then(
        (value) async {
          loginSuccess();
          await Future.delayed(
            const Duration(milliseconds: 500),
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeDrawerScreen(),
                ),
              );
            },
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      loginFailed();
      print(e);
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
