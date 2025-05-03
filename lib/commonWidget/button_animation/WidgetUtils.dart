import 'package:flutter/material.dart';

class WidgetUtils {
  static late String lang;
  static late TextStyle textStyle;
  static String? fontFamily;
  static double? textScaleFactor;
  static late InputDecoration Function({
    String? label,
    String? hint,
    Widget? prefixIcon,
    Color? hintColor,
    Color? fillColor,
    Widget? suffixIcon,
    Widget? suffixWidget,
    Widget? prefixWidget,
    EdgeInsets? padding,
    BorderRadius? radius,
    Color? focusBorderColor,
    Color? enableColor,
    double? hintSize,
  }) setInputDecoration;

  static init({
    required TextStyle style,
    required Color primary,
    required String language,
    String? myTextFontFamily,
    double? scaleFactor,
    required InputDecoration Function({
      String? label,
      String? hint,
      Widget? prefixIcon,
      Widget? suffixIcon,
      Widget? suffixWidget,
      Widget? prefixWidget,
      Color? hintColor,
      Color? fillColor,
      BorderRadius? radius,
      Color? focusBorderColor,
      EdgeInsets? padding,
      Color? enableColor,
      double? hintSize,
    }) inputStyle,
  }) {
    textStyle = style;
    fontFamily = myTextFontFamily;
    textScaleFactor = scaleFactor;
    lang = language;
    setInputDecoration = inputStyle;
  }
}
