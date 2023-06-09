import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
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
          const Duration(milliseconds: 500),
          () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => MyAnimatedLoginScreen()));
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
