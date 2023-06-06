import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class MyAnimatedButton extends StatelessWidget {
  const MyAnimatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      height: 67,
      width: 150,
      borderRadius: 20,
      onPress: () {},
      text: 'Join Now',
      gradient: LinearGradient(colors: []),
    );
  }
}
