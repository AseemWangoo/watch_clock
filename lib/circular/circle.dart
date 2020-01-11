import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircleProgress extends StatefulWidget {
  CircleProgress({Key key}) : super(key: key);

  @override
  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State with SingleTickerProviderStateMixin {
  AnimationController progressController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0, end: 100).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    //

    return CustomPaint(
      foregroundPainter: CircleProgressPainter(
        animation.value,
      ), // this will add custom painter after child
      child: Container(
        width: 200,
        height: 200,
        child: GestureDetector(
          onTap: () {
            if (animation.value == 100) {
              progressController.reverse();
            } else {
              progressController.forward();
            }
          },
          child: Center(
            child: Text(
              "${animation.value.toInt()}%",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }
}

class CircleProgressPainter extends CustomPainter {
  double currentProgress;

  CircleProgressPainter(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
      center,
      radius,
      outerCircle,
    ); // this draws main outer circle

    double angle = 2 * math.pi * (currentProgress / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      angle,
      false,
      completeArc,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
