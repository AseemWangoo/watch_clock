import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_clock/circular/hour_painter.dart';
import 'package:watch_clock/circular/minute_painter.dart';
import 'package:watch_clock/circular/painter.dart';
import 'package:watch_clock/circular/second_painter.dart';
import 'package:watch_clock/models/time.dart';

class SampleClock extends StatelessWidget {
  const SampleClock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Stack(
      children: [
        // Container(
        //   height: 300.0,
        //   width: 300.0,
        //   // decoration: BoxDecoration(
        //   //   shape: BoxShape.circle,
        //   //   color: Colors.grey,
        //   // ),
        //   child: CustomPaint(
        //     painter: BellsAndLegsPainter(),
        //   ),
        // ),
        Container(
          height: 300.0,
          width: 300.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    height: 300.0,
                    padding: const EdgeInsets.all(10.0),
                    child: CustomPaint(
                      painter: ClockDialPainter(clockText: ClockText.roman),
                    ),
                  ),
                  Container(
                    height: 300.0,
                    width: 300.0,
                    padding: const EdgeInsets.all(40.0),
                    child: Consumer<TimeModel>(
                      builder: (_, model, __) {
                        //

                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            CustomPaint(
                              painter: HourHandPainter(
                                hours: model.currentHour,
                                minutes: model.currentMinute,
                              ),
                            ),
                            CustomPaint(
                              painter: MinuteHandPainter(
                                minutes: model.currentMinute,
                                seconds: model.currentSecond,
                              ),
                            ),
                            CustomPaint(
                              painter: SecondHandPainter(
                                seconds: model.currentSecond,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  final Paint legPaint;

  final int seconds;

  ClockPainter({this.seconds = 0}) : legPaint = Paint() {
    legPaint.color = Colors.black;
    legPaint.style = PaintingStyle.stroke;
    legPaint.strokeWidth = 8.0;
    legPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);
    canvas.rotate(2 * pi * this.seconds / 60);

    Path path = Path();
    path.lineTo(0.0, -radius + 5.0);

    canvas.drawPath(path, legPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MinutePainter extends CustomPainter {
  final Paint legPaint;
  final int minutes;
  final int seconds;

  MinutePainter({
    this.minutes = 0,
    this.seconds = 0,
  }) : legPaint = Paint() {
    legPaint.color = Colors.black;
    legPaint.style = PaintingStyle.stroke;
    legPaint.strokeWidth = 8.0;
    legPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * ((this.minutes + (this.seconds / 60)) / 60));

    Path path = Path();
    path.lineTo(-8.5, -radius + 20.0);
    path.close();

    canvas.drawPath(path, legPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(MinutePainter oldDelegate) => false;
}

class HourPainter extends CustomPainter {
  final Paint legPaint;
  final int hours;
  final int minutes;

  HourPainter({
    this.hours = 0,
    this.minutes = 0,
  }) : legPaint = Paint() {
    legPaint.color = Colors.black;
    legPaint.style = PaintingStyle.stroke;
    legPaint.strokeWidth = 8.0;
    legPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(this.hours >= 12
        ? 2 * pi * ((this.hours - 12) / 12 + (this.minutes / 720))
        : 2 * pi * ((this.hours / 12) + (this.minutes / 720)));

    Path path = Path();
    path.lineTo(0.0, -radius + radius / 3);
    path.close();

    canvas.drawPath(path, legPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(HourPainter oldDelegate) => false;
}
