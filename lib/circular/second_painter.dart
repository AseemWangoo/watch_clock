import 'dart:math';

import 'package:flutter/material.dart';

class SecondHandPainter extends CustomPainter {
  final Paint secondHandPaint;

  int seconds;

  SecondHandPainter({this.seconds}) : secondHandPaint = Paint() {
    secondHandPaint.color = Colors.blue;
    secondHandPaint.style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * this.seconds / 60);

    Path path1 = Path();
    path1.moveTo(0.0, -radius);
    path1.lineTo(0.0, radius / 4 - 20.0);

    canvas.drawPath(path1, secondHandPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(SecondHandPainter oldDelegate) {
    return this.seconds != oldDelegate.seconds;
  }
}
