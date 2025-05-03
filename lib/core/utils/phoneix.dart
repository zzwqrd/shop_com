import 'package:flutter/material.dart';

class Phoenix extends StatefulWidget {
  const Phoenix({super.key, required this.child});

  final Widget child;

  static void rebirth(BuildContext context) {
    context.findAncestorStateOfType<_PhoenixState>()?.restartApp();
  }

  @override
  State<Phoenix> createState() => _PhoenixState();
}

class _PhoenixState extends State<Phoenix> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
