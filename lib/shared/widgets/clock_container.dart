import 'package:flutter/material.dart';

class ClockContainer extends StatelessWidget {
  /// Specify the decoration for the dial...
  final Decoration decoration;

  /// Specify the widget for this container...
  final Widget child;

  /// Generic container for the hour and minute face...
  const ClockContainer({
    Key key,
    @required this.decoration,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      height: 200.0,
      width: 200.0,
      decoration: decoration,
      child: child,
    );
  }
}
