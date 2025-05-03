import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/utils/extensions.dart';
import '../routes/app_routes_fun.dart';

extension RichTextExtension on BuildContext {
  /// Build a rich text with tap recognizer
  Widget buildRichText({
    required String text,
    required VoidCallback onTap,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return Text.rich(
      TextSpan(
        text: text,
        style: style ??
            navigatorKey.currentContext!.regularText.copyWith(fontSize: 14),
        recognizer: TapGestureRecognizer()..onTap = onTap,
      ),
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
        decorationColor: decorationColor,
      ),
    );
  }

  /// Build an underlined rich text with tap recognizer
  Widget buildUnderlinedRichText({
    required String text,
    required VoidCallback onTap,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    Color? underlineColor,
  }) {
    return buildRichText(
      text: text,
      onTap: onTap,
      style: style ??
          navigatorKey.currentContext!.regularText.copyWith(fontSize: 14),
      decoration: TextDecoration.underline,
      decorationColor:
          underlineColor ?? navigatorKey.currentContext!.secondaryColor,
    );
  }
}
