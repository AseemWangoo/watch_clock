import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_clock/models/time.dart';
import 'package:watch_clock/shared/utils/screen_size.dart';

enum TimeDisplay { hour, minute }

class TimeText extends StatelessWidget {
  final double position;

  final TimeDisplay timeDisplay;

  const TimeText({
    Key key,
    this.position = -200.0,
    this.timeDisplay = TimeDisplay.hour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Positioned(
      left: position,
      child: Container(
        height: 200.0,
        width: 200.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Consumer<TimeModel>(
            builder: (_, model, __) {
              //
              if (timeDisplay == TimeDisplay.hour)
                return _TextWidget(value: model.hourToDisplay);
              else
                return _TextWidget(value: model.minuteToDisplay);
            },
          ),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String value;

  const _TextWidget({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _width = ScreenQueries.instance.width(context);

    return Text(
      value,
      style: TextStyle(
        foreground: Paint()
          ..shader = _TextShader(value: _width).displayShadeEffect,
        fontSize: 120.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _TextShader extends Paint {
  final double value;

  _TextShader({this.value = 800.0});

  Shader get displayShadeEffect => LinearGradient(
        colors: [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
      ).createShader(
        Rect.fromLTWH(0.0, 0.0, value, 0.0),
      );
}
