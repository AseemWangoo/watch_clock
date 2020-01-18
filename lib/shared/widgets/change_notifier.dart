import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;

  final Widget child;

  final Widget Function(BuildContext context, T model, Widget child) builder;

  /// Generic widget for the ChangeNotifierProvider...
  ChangeNotifierWidget({
    Key key,
    this.builder,
    this.model,
    this.child,
  }) : super(key: key);

  @override
  _ChangeNotifierWidgetState<T> createState() =>
      _ChangeNotifierWidgetState<T>();
}

class _ChangeNotifierWidgetState<T extends ChangeNotifier>
    extends State<ChangeNotifierWidget<T>> {
  //
  T model;

  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //

    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
