import 'package:flutter/material.dart' show BuildContext, MediaQuery;

class ScreenQueries {
  ScreenQueries._privateConstructor();

  /// GENERIC INSTANCE OF ScreenQueries CLASS.....
  static final instance = ScreenQueries._privateConstructor();

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double height(BuildContext context) => MediaQuery.of(context).size.height;
}
