import 'dart:async' show Timer;

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:intl/intl.dart' show DateFormat;

class TimeModel with ChangeNotifier {
  DateTime _timestamp = DateTime.now();

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
}
