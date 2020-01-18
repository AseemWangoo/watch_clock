import 'dart:math' as math show pi;
import 'package:flutter/material.dart';

enum ClockHand { hour, minute, second }

class GenericPainter extends CustomPainter {
  final Paint handPaint;

  /// What is the clock hand you want to display...
  ///
  /// An enum `ClockHand` having values `hour`, `minute` and `second`
  final ClockHand clockHand;

  /// What is the current hour...
  final int hours;

  /// What is the current minute...
  final int minutes;

  /// What is the current second...
  final int seconds;

  /// Painter for generating the circular dial
  ///
  /// for the clock...
  GenericPainter({
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
    this.clockHand = ClockHand.hour,
  }) : handPaint = Paint() {
    handPaint.color = Colors.white;
    handPaint.style = PaintingStyle.stroke;
    handPaint.strokeWidth = 7.0;
    handPaint.strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    switch (clockHand) {
      case ClockHand.hour:
        canvas.rotate(
          this.hours >= 12
              ? 2 * math.pi * ((this.hours - 12) / 12 + (this.minutes / 720))
              : 2 * math.pi * ((this.hours / 12) + (this.minutes / 720)),
        );

        Path path = Path();
        path.lineTo(0.0, -radius + radius / 2.5);
        path.close();

        canvas.drawPath(path, handPaint);
        break;

      case ClockHand.minute:
        canvas.rotate(
          2 * math.pi * ((this.minutes + (this.seconds / 60)) / 60),
        );

        Path path = Path();
        path.lineTo(-8.5, -radius + 20.0);
        path.close();

        canvas.drawPath(path, handPaint);
        break;

      case ClockHand.second:
        canvas.rotate(2 * math.pi * this.seconds / 60);

        Path path = Path();
        path.lineTo(0.0, -radius + 5.0);

        canvas.drawPath(path, handPaint);
        break;
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
