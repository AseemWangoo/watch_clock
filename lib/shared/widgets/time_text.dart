import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_clock/models/time.dart';
import 'package:watch_clock/shared/utils/screen_size.dart';

enum TimeDisplay { hour, minute }

class TimeText extends StatelessWidget {
  /// Specify the position to display the text...
  final double position;

  /// What is the text you want to display...
  ///
  /// An enum `TimeDisplay` having values `TimeDisplay.hour` and `TimeDisplay.minute`
  final TimeDisplay timeDisplay;

  /// Display the Time (hours and minutes)
  ///
  /// in big text...
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
