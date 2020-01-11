import 'dart:math';

import 'package:flutter/material.dart';
import 'package:watch_clock/circular/sample.dart';

class RotationAnimation extends StatefulWidget {
  @override
  _RotationAnimationState createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        //

        return Transform.rotate(
          angle: _animation.value,
          child: child,
        );
      },
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: CustomPaint(
          painter: BellsAndLegsPainter(),
        ),
      ),
    );
  }
}
