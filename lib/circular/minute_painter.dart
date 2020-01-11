import 'dart:math';

import 'package:flutter/material.dart';

class MinuteHandPainter extends CustomPainter {
  final Paint minuteHandPaint;
  int minutes;
  int seconds;

  MinuteHandPainter({this.minutes, this.seconds}) : minuteHandPaint = Paint() {
    minuteHandPaint.color = const Color(0xFF333333);
    minuteHandPaint.style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * ((this.minutes + (this.seconds / 60)) / 60));

    Path path = Path();
    path.lineTo(1.5, -radius - 1.0);
    path.close();

    canvas.drawPath(path, minuteHandPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(MinuteHandPainter oldDelegate) => true;
}
