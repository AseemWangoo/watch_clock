import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

import 'package:watch_clock/clock/hour_face.dart';
import 'package:watch_clock/clock/minute_face.dart';
import 'package:watch_clock/clock/second_face.dart';
import 'package:watch_clock/models/time.dart';
import 'package:watch_clock/shared/widgets/change_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final List<Widget> _clock = [HourFace(), MinuteFace(), SecondFace()];

    return Scaffold(
      body: SafeArea(
        child: Align(
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChangeNotifierWidget<TimeModel>(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _clock,
                ),
                model: TimeModel(),
                builder: (context, model, child) {
                  //
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(model.currentTime),
                        child,
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
