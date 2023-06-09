import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MyAnimatedLoginScreen extends StatefulWidget {
  const MyAnimatedLoginScreen({super.key});

  @override
  State<MyAnimatedLoginScreen> createState() => _MyAnimatedLoginScreenState();
}

class _MyAnimatedLoginScreenState extends State<MyAnimatedLoginScreen> {
  Artboard? _artboard;
  late RiveAnimationController idle;
  late RiveAnimationController handsDown;
  late RiveAnimationController handsUp;
  late RiveAnimationController success;
  late RiveAnimationController fail;
  late RiveAnimationController lookDownLeft;
  late RiveAnimationController lookDownRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Rive(
              artboard: _artboard!,
            ),
          )
        ],
      ),
    );
  }
}
