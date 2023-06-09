import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project_1/src/constants/image_strings.dart';
import 'package:rive/rive.dart';

import '../../../animations/animatedEnum.dart';

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
  void initState() {
    super.initState();
    idle = SimpleAnimation(Animated.idle.name);
    idle = SimpleAnimation(Animated.handsDown.name);
    idle = SimpleAnimation(Animated.handsUp.name);
    idle = SimpleAnimation(Animated.success.name);
    idle = SimpleAnimation(Animated.fail.name);
    idle = SimpleAnimation(Animated.lookDownLeft.name);
    idle = SimpleAnimation(Animated.lookDownRight.name);
    rootBundle.load(myLoginPageBearAnimation).then((value) {
      final file = RiveFile.import(value);
      final artboard = file.mainArtboard;
      artboard.addController(idle);
      setState(() {
        _artboard = artboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Rive(artboard: _artboard!),
          )
        ],
      ),
    );
  }
}
