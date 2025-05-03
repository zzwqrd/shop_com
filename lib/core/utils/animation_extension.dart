import 'package:flutter/material.dart';

// Extension on Widget for animations
extension AnimationExtension on Widget {
  // Fade Animation
  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: this,
    );
  }

  // Scale Animation
  Widget scaleIn({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
    double begin = 0.5,
    double end = 1.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: this,
    );
  }

  // Slide Animation
  Widget slideIn({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
    Offset offset = const Offset(1, 0), // Default: Slide from right
  }) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: offset, end: Offset.zero),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.translate(
            offset: Offset(value.dx * 100, value.dy * 100), child: child);
      },
      child: this,
    );
  }

  // Rotation Animation
  Widget rotateIn({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
    double turns = 1.0, // Full rotation
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: turns),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.rotate(angle: value * 2 * 3.14159, child: child);
      },
      child: this,
    );
  }

  // Bounce Animation
  Widget bounceIn({
    Duration duration = const Duration(milliseconds: 1000),
    Curve curve = Curves.bounceOut,
    double scale = 1.5, // Bounce scale factor
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: scale, end: 1.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: this,
    );
  }
}
