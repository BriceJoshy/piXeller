import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:mini_project_1/src/constants/colors.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:mini_project_1/src/constants/text_strings.dart';
import 'package:mini_project_1/src/features/authentication/models/model_on_boarding.dart';

late Size mq;

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: [
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
