import 'dart:async' show Timer;

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/material.dart' show Color, Colors;
import 'package:intl/intl.dart' show DateFormat;

class TimeModel with ChangeNotifier {
  DateTime _timestamp = DateTime.now();

  /// Base model for displaying the current time....
  TimeModel() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _timestamp = DateTime.now();
      notifyListeners();
    });
  }

  /// Fetch current time...
  String get currentTime => _formatDateTime(_timestamp);

  /// Fetch current hour...
  int get currentHour => _currentHour(_timestamp);

  /// Fetch current minute...
  int get currentMinute => _currentMinute(_timestamp);

  /// Fetch current second...
  int get currentSecond => _currentSecond(_timestamp);

  /// Display minute
  String get minuteToDisplay => _minuteToDisplay();

  /// Display hour
  String get hourToDisplay => _hourToDisplay();

  /// Color Gradient to display...
  List<Color> get colorGradient => _colorGradient();

  String _formatDateTime(DateTime timestamp) {
    final hour = DateFormat('HH').format(timestamp);
    final minute = DateFormat('mm').format(timestamp);
    final seconds = DateFormat('ss').format(timestamp);

    return hour + ':' + minute + ':' + seconds;
  }

  int _currentHour(DateTime timestamp) {
    final hour = DateFormat('HH').format(timestamp);
    return int.parse(hour);
  }

  int _currentMinute(DateTime timestamp) {
    final minute = DateFormat('mm').format(timestamp);
    return int.parse(minute);
  }

  int _currentSecond(DateTime timestamp) {
    final second = DateFormat('ss').format(timestamp);
    return int.parse(second);
  }

  String _minuteToDisplay() {
    String _minute = _currentMinute(_timestamp).toString();
    if (_minute.length < 2) {
      _minute = '0' + _minute;
    }

    return _minute;
  }

  String _hourToDisplay() {
    String _hour = _currentHour(_timestamp).toString();
    if (_hour.length < 2) {
      _hour = '0' + _hour;
    }

    return _hour;
  }

  List<Color> _colorGradient() {
    List<Color> _colorList = [Colors.white, Colors.white];
    int _hour = _currentHour(_timestamp);

    // 8pm to 5:59am
    if (_hour >= 20 && _hour <= 24 || _hour >= 0 && _hour <= 5) {
      _colorList = [Colors.blue, Colors.indigo];
    }

    // 6am to 8:59 am
    if (_hour >= 6 && _hour <= 8) {
      _colorList = [Colors.orange, Colors.blue];
    }

    // 9am to 10:59 am
    if (_hour >= 9 && _hour <= 10) {
      _colorList = [Colors.purple, Colors.blue, Colors.yellow, Colors.red];
    }

    // 11am to 4:59 pm
    if (_hour >= 11 && _hour <= 16) {
      _colorList = [Colors.yellow, Colors.orange];
    }

    // 5pm to 7:59 pm
    if (_hour >= 17 && _hour <= 19) {
      _colorList = [Colors.orange, Colors.yellow, Colors.red];
    }

    return _colorList;
  }
}
