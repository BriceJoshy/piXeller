import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:rive/rive.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
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
        ],
      ),
    );
  }
}
