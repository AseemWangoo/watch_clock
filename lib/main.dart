import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:intl/intl.dart';

import 'package:watch_clock/circular/circle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home({Key key}) : super(key: key);

  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  String _currentTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (t) => _fetchTime());
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      body: SafeArea(
        child: Align(
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_currentTime.toString()),
                  CircleProgress(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _fetchTime() {
    final DateTime _timestamp = DateTime.now();
    setState(() => _currentTime = _formatDateTime(_timestamp));
  }

  String _formatDateTime(DateTime timestamp) {
    final hour = DateFormat('HH').format(timestamp);
    final minute = DateFormat('mm').format(timestamp);
    final seconds = DateFormat('ss').format(timestamp);

    return hour + ':' + minute + ':' + seconds;
  }
}
