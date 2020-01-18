import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_clock/models/time.dart';
import 'package:watch_clock/shared/utils/screen_size.dart';
import 'package:watch_clock/shared/widgets/clock_container.dart';

enum TimeDisplay { hour, minute }

class TimeText extends StatelessWidget {
  /// What is the text you want to display...
  ///
  /// An enum `TimeDisplay` having values `TimeDisplay.hour` and `TimeDisplay.minute`
  final TimeDisplay timeDisplay;

  /// Display the Time (hours and minutes)
  ///
  /// in big text...
  const TimeText({
    Key key,
    this.timeDisplay = TimeDisplay.hour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _dimension = ScreenQueries.instance.genericDimension(context);

    double _position = 0.0;
    if (timeDisplay == TimeDisplay.hour)
      _position = _dimension * -1;
    else
      _position = _dimension;

    return Positioned(
      left: _position,
      child: ClockContainer(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Align(
          alignment: Alignment.center,
          child: Consumer<TimeModel>(
            builder: (_, model, __) {
              //
              if (timeDisplay == TimeDisplay.hour)
                return _TextWidget(
                  colors: model.colorGradient,
                  value: model.hourToDisplay,
                );
              else
                return _TextWidget(
                  colors: model.colorGradient,
                  value: model.minuteToDisplay,
                );
            },
          ),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String value;

  final List<Color> colors;

  const _TextWidget({
    Key key,
    @required this.colors,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _width = ScreenQueries.instance.width(context);

    return Text(
      value,
      style: TextStyle(
        foreground: Paint()
          ..shader = _TextShader(
            colors: colors,
            value: _width,
          ).displayShadeEffect,
        fontSize: 120.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _TextShader extends Paint {
  final double value;

  final List<Color> colors;

  _TextShader({this.value = 800.0, @required this.colors});

  Shader get displayShadeEffect => LinearGradient(
        colors: colors,
      ).createShader(
        Rect.fromLTWH(0.0, 0.0, value, 0.0),
      );
}
