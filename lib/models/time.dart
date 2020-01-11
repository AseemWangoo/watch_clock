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

  int get currentHour => _currentHour(_timestamp);
  int get currentMinute => _currentMinute(_timestamp);
  int get currentSecond => _currentSecond(_timestamp);

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
}
