import 'package:flutter/material.dart';

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

// class BellsAndLegsPainter extends CustomPainter {
//   // final Paint bellPaint;
//   final Paint legPaint;

//   BellsAndLegsPainter() : legPaint = Paint() {
//     legPaint.color = Colors.black;
//     legPaint.style = PaintingStyle.stroke;
//     legPaint.strokeWidth = 10.0;
//     legPaint.strokeCap = StrokeCap.round;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     final radius = size.width / 2;
//     canvas.save();

//     canvas.translate(radius, radius);

//     //draw left leg
//     canvas.rotate(2 * pi / 12);
//     drawLeg(radius, canvas);

//     //draw left bell and right leg
//     canvas.rotate(-4 * pi / 12);
//     drawLeg(radius, canvas);

//     canvas.restore();
//   }

//   void drawLeg(radius, canvas) {
//     //bell
//     Path path1 =  Path();
//     path1.moveTo(-55.0, -radius - 5);
//     path1.lineTo(55.0, -radius - 5);
//     path1.quadraticBezierTo(0.0, -radius - 75, -55.0, -radius - 10);

//     //leg
//     Path path2 =  Path();
//     path2.addOval( Rect.fromCircle(
//         center:  Offset(0.0, -radius - 50), radius: 3.0));
//     path2.moveTo(0.0, -radius - 50);
//     path2.lineTo(0.0, radius + 20);

//     //draw the bell on top on the leg
//     canvas.drawPath(path2, legPaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
