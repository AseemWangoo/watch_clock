import 'package:flutter/material.dart';
import 'package:watch_clock/shared/utils/screen_size.dart';

class ClockContainer extends StatelessWidget {
  final Decoration decoration;

  final Widget child;

  const ClockContainer({
    Key key,
    @required this.decoration,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _dimension = ScreenQueries.instance.width(context);

    return Container(
      height: 200.0,
      width: 200.0,
      decoration: decoration,
      child: child,
    );
  }
}
