import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingTextAnimation});

  final Animation<Offset> slidingTextAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingTextAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slidingTextAnimation,
          child: Text('Read Free Books', textAlign: TextAlign.center),
        );
      },
    );
  }
}
