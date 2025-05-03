import 'package:flutter/material.dart';

class Unfocus extends StatefulWidget {
  final Widget? child;
  const Unfocus({super.key, this.child});

  @override
  State<Unfocus> createState() => _UnfocusState();
}

class _UnfocusState extends State<Unfocus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: widget.child,
    );
  }
}
