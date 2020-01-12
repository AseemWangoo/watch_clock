import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_clock/circular/sample.dart';
import 'package:watch_clock/models/time.dart';

class MinuteFace extends StatelessWidget {
  const MinuteFace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      height: 300.0,
      width: 300.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Consumer<TimeModel>(
        builder: (_, model, __) {
          //
          return CustomPaint(
            painter: ClockPainter(seconds: model.currentSecond),
          );
        },
      ),
    );
  }
}
