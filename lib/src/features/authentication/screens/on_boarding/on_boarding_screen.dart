import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mini_project_1/src/constants/colors.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: [
              Container(
                color: myOnboardingPage1Color,
              ),
              Container(
                color: myOnboardingPage2Color,
              ),
              Container(
                color: myOnboardingPage3Color,
              )
            ],
          )
        ],
      ),
    );
  }
}
