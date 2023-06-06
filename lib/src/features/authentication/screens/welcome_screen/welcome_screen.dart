import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:mini_project_1/src/features/animations/animated_button.dart';
import 'package:rive/rive.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 200,
            left: 100,
            // height: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            child: Image.asset(myWelcomePageSpline),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(myWelcomePageShapesAnimation),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 70),
              child: Column(
                children: [
                  Text(
                    "Linking Producers, Expanding Markets!",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 43,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Our app serves as a powerful platform, bridging the gap between producers and distributors.",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Positioned(child: MyAnimatedButton()),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
