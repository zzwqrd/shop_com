import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  /// Large Text Style
  static TextStyle get largeText => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      );

  /// Medium Text Style
  static TextStyle get mediumText => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppColors.blackColor,
      );

  /// Small Text Style
  static TextStyle get smallText => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.greyColor,
      );

  /// Input Decoration Theme
  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle:
            mediumText.copyWith(fontSize: 14, color: AppColors.greyColor),
        hintStyle: smallText.copyWith(fontSize: 12, color: AppColors.greyColor),
        fillColor: AppColors.whiteColor,
        filled: true,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
      );
}
