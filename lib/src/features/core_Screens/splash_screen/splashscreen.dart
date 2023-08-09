import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/apis/api.dart';

import '../homescreen/homedrawerScreen/homedrawerScreen.dart';
import '../on_boarding/on_boarding_screen.dart';

//global object for accessing device screen size
late Size mq;
var screenWidth, screenHeight;

// statefull widget as we are dynamically changing it
class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      //exit fullscreen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: [SystemUiOverlay.top]);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness
              .dark)); //need it to be transparent in both light&dark themes
      if (APIs.auth.currentUser != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const HomeDrawerScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const onBoardingScreen()));
      }
    }); // after one and half a second
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset("assets/logo/logo.png"),
            const SizedBox(
              height: 20,
            ),
            Text("piXeller",
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 150,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       top: mq.height * .3, // 30 % from top of screen
      //       width: mq.width *
      //           .80, // 80 % of the screen leaves 10 % on each side for space look left mq
      //       right: mq.width * .10, // 10% from left
      //       child: Image.asset(
      //         'assets/icons/app_title.png',
      //         color: Colors.black,
      //         height: 250,
      //       ),
    );
    // Positioned(
    //   bottom: mq.height * .2,
    //   left: mq.width * .4,
    //   child: Image.asset(
    //     "assets/images/loading.gif",
    //     height: 50,
    //   ),
    //       // ),
    //     ],
    //   ),
    // );
  }
}
