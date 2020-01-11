import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'package:provider/provider.dart';

import 'package:watch_clock/circular/circle.dart';
import 'package:watch_clock/models/time.dart';

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

    return ChangeNotifierProvider<TimeModel>(
      create: (_) => TimeModel(),
      child: Scaffold(
        body: SafeArea(
          child: Align(
            child: AspectRatio(
              aspectRatio: 5 / 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<TimeModel>(
                  child: CircleProgress(),
                  builder: (context, model, child) {
                    //

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(model.currentTime),
                        child,
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
