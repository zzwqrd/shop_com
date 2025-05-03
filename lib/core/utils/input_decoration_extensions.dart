import 'package:flutter/material.dart';

extension InputDecorationExtension on InputDecoration {
  /// Applies the given InputDecorationTheme to this InputDecoration.
  InputDecoration applyInputDecorationTheme(InputDecorationTheme theme) {
    return copyWith(
      floatingLabelBehavior: theme.floatingLabelBehavior,
      labelStyle: theme.labelStyle,
      hintStyle: theme.hintStyle,
      fillColor: theme.fillColor,
      filled: theme.filled,
      focusedErrorBorder: theme.focusedErrorBorder,
      errorBorder: theme.errorBorder,
      disabledBorder: theme.disabledBorder,
      border: theme.border,
      focusedBorder: theme.focusedBorder,
      enabledBorder: theme.enabledBorder,
      contentPadding: theme.contentPadding,
    );
  }
}
