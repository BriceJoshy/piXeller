import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 500);

    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: (500 * delay).round())),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox.shrink(); // Placeholder widget during the delay
        } else {
          return AnimatedOpacity(
            opacity: 1.0,
            duration: animationDuration,
            curve: Curves.easeOut,
            child: child,
          );
        }
      },
    );
  }
}
