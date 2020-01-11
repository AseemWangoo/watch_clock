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

class BellsAndLegsPainter extends CustomPainter {
  final Paint legPaint;

  BellsAndLegsPainter() : legPaint = Paint() {
    legPaint.color = Colors.black;
    legPaint.style = PaintingStyle.stroke;
    legPaint.strokeWidth = 10.0;
    legPaint.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    // canvas.rotate(2 * pi / 12);
    drawBellAndLeg(radius, canvas);

    canvas.restore();
  }

  void drawBellAndLeg(radius, canvas) {
    Path path2 = Path();
    path2.moveTo(0.0, -radius);
    path2.lineTo(0.0, radius);

    canvas.drawPath(path2, legPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
