import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingTextAnimation});

  final Animation<Offset> slidingTextAnimation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slidingTextAnimation,
      child: const Text(
        'Read Free Books',
        textAlign: TextAlign.center,
        semanticsLabel: 'Read Free Books',
      ),
    );
  }
}
