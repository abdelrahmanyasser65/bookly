import 'package:flutter/material.dart';
class SlideText extends StatelessWidget {
  const SlideText({Key? key, required this.slidingAnimation}) : super(key: key);
 final Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      builder:(context,_)=> SlideTransition(
        position: slidingAnimation,
        child: const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
        ),
      ),
      animation: slidingAnimation,
    );
  }
}
