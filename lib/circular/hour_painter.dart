import 'dart:math';

import 'package:flutter/material.dart';

class HourHandPainter extends CustomPainter {
  final Paint hourHandPaint;
  int hours;
  int minutes;

  HourHandPainter({this.hours, this.minutes}) : hourHandPaint = Paint() {
    hourHandPaint.color = Colors.black;
    hourHandPaint.style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    //checks if hour is greater than 12 before calculating rotation
    canvas.rotate(this.hours >= 12
        ? 2 * pi * ((this.hours - 12) / 12 + (this.minutes / 720))
        : 2 * pi * ((this.hours / 12) + (this.minutes / 720)));

    Path path = Path();
    path.lineTo(1.0, -radius + radius / 3);
    path.close();

    canvas.drawPath(path, hourHandPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(HourHandPainter oldDelegate) => true;
}
