import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:watch_clock/clock/clock_painter.dart';
import 'package:watch_clock/models/time.dart';
import 'package:watch_clock/shared/utils/screen_size.dart';
import 'package:watch_clock/shared/widgets/clock_container.dart';

class HourFace extends StatefulWidget {
  /// Display the hour hand of the clock...
  const HourFace({Key key}) : super(key: key);

  @override
  _HourFaceState createState() => _HourFaceState();
}

class _HourFaceState extends State<HourFace>
    with SingleTickerProviderStateMixin {
  //

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.4,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _controller.forward().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    //
    final _dimension = ScreenQueries.instance.genericDimension(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: _animation.value * _dimension * -1,
          child: child,
        );
      },
      child: ClockContainer(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[850],
        ),
        child: Consumer<TimeModel>(
          builder: (_, model, __) {
            //
            return CustomPaint(
              painter: GenericPainter(
                clockHand: ClockHand.hour,
                hours: model.currentHour,
                minutes: model.currentMinute,
                seconds: model.currentSecond,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
