import 'package:flutter/material.dart';

extension ThemeTextExtension on ThemeData {
  /// Get large text style
  TextStyle get largeText => textTheme.labelLarge ?? const TextStyle();

  /// Get medium text style
  TextStyle get mediumText => textTheme.labelMedium ?? const TextStyle();

  /// Get small text style
  TextStyle get smallText => textTheme.labelSmall ?? const TextStyle();

  /// Get custom headline style
  TextStyle get headline => textTheme.headlineMedium ?? const TextStyle();

  /// Get custom body text style
  TextStyle get bodyText => textTheme.bodyMedium ?? const TextStyle();
}
