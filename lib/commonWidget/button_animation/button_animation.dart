import 'dart:ui';

import 'package:flutter/material.dart';

enum ButtonState { Busy, Idle }

class CustomButtonAnimation extends StatefulWidget {
  final double height;
  final double width;
  final double minWidth;
  final Widget? loader;
  final Duration animationDuration;
  final Curve curve;
  final Curve reverseCurve;
  final Widget child;
  final Function() onTap;
  final Color? color;
  final Brightness? colorBrightness;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool roundLoadingShape;
  final double borderRadius;
  final BorderSide borderSide;
  final double? disabledElevation;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool isAnimating; // إضافة الخاصية isAnimating

  const CustomButtonAnimation({
    required this.height,
    required this.width,
    this.minWidth = 0,
    this.loader,
    this.animationDuration = const Duration(milliseconds: 450),
    this.curve = Curves.easeInOutCirc,
    this.reverseCurve = Curves.easeInOutCirc,
    required this.child,
    required this.onTap,
    this.color,
    this.colorBrightness,
    this.elevation,
    this.padding = const EdgeInsets.all(0),
    this.borderRadius = 0.0,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.materialTapTargetSize,
    this.roundLoadingShape = true,
    this.borderSide =
        const BorderSide(color: Color.fromARGB(0, 255, 254, 254), width: 0),
    this.disabledElevation,
    this.disabledColor,
    this.disabledTextColor,
    required this.isAnimating, // إضافة الخاصية هنا
    super.key,
  })  : assert(elevation == null || elevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButtonAnimation>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  ButtonState btn = ButtonState.Idle;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve));

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          btn = ButtonState.Idle;
        });
      }
    });

    if (widget.isAnimating) {
      animateForward(); // تشغيل الحركة إذا كانت isAnimating == true
    }
  }

  @override
  void didUpdateWidget(CustomButtonAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      if (widget.isAnimating) {
        animateForward();
      } else {
        animateReverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animateForward() {
    setState(() {
      btn = ButtonState.Busy;
    });
    _controller.forward();
  }

  void animateReverse() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return buttonBody();
      },
    );
  }

  Widget buttonBody() {
    return InkWell(
      focusNode: widget.focusNode,
      onTap: widget.onTap,
      child: Container(
        height: btn == ButtonState.Idle ? widget.height : 80,
        decoration: BoxDecoration(
          color: btn == ButtonState.Idle
              ? widget.color
              : widget.color!.withOpacity(0.0),
          borderRadius: BorderRadius.circular(widget.roundLoadingShape
              ? lerpDouble(
                  widget.borderRadius, widget.height / 2, _animation.value)!
              : widget.borderRadius),
        ),
        alignment: Alignment.center,
        child: btn == ButtonState.Idle ? widget.child : widget.loader,
      ),
    );
  }
}
