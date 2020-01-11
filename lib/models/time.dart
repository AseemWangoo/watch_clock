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

  String _formatDateTime(DateTime timestamp) {
    final hour = DateFormat('HH').format(timestamp);
    final minute = DateFormat('mm').format(timestamp);
    final seconds = DateFormat('ss').format(timestamp);

    return hour + ':' + minute + ':' + seconds;
  }
}
