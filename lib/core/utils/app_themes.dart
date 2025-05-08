import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/extensions.dart';

extension ThemeDataExtension on ThemeData {
  /// Returns the light theme
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        indicatorColor: AppColors.greenColor,
        primaryColor: AppColors.mainColor,
        focusColor: AppColors.focusColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        textTheme: _textTheme,
        hoverColor: AppColors.borderColor,
        // fontFamily: LocaleKeys.lang.tr() == 'en'
        //     ? FontFamily.poppins
        //     : FontFamily.iBMPlexSansArabic,
        hintColor: AppColors.greyColor,
        primaryColorLight: AppColors.whiteColor,
        primaryColorDark: AppColors.blackColor,
        dialogTheme: DialogThemeData(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        disabledColor: AppColors.whiteColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.secondaryColor,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: AppColors.whiteColor,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            // fontFamily: LocaleKeys.lang.tr() == 'en'
            //     ? FontFamily.poppins
            //     : FontFamily.iBMPlexSansArabic,
            color: AppColors.blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.whiteColor,
          selectedItemColor: AppColors.mainColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: "#CBD1DB".color),
          unselectedItemColor: "#CBD1DB".color,
          enableFeedback: true,
        ),
        radioTheme:
            RadioThemeData(fillColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.mainColor
              : AppColors.mainColor;
        })),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000),
            borderSide: BorderSide.none,
          ),
          iconSize: 24.h,
          backgroundColor: AppColors.mainColor,
          elevation: 1,
        ),
        colorScheme: const ColorScheme.light(
          primaryContainer: AppColors.primaryContainer,
          secondary: AppColors.secondaryColor,
          primary: AppColors.mainColor,
          error: AppColors.redColor,
        ),
        timePickerTheme: const TimePickerThemeData(
          elevation: 0,
          dialHandColor: AppColors.mainColor,
          dialTextColor: Colors.black,
          backgroundColor: Colors.white,
          hourMinuteColor: AppColors.whiteColor,
          dayPeriodTextColor: Colors.black,
          entryModeIconColor: Colors.transparent,
          dialBackgroundColor: AppColors.whiteColor,
          hourMinuteTextColor: Colors.black,
          dayPeriodBorderSide: BorderSide(color: AppColors.mainColor),
        ),
        dividerTheme: const DividerThemeData(color: AppColors.borderColor),
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: AppStyles.inputDecorationTheme),
        checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r))),
        inputDecorationTheme: AppStyles.inputDecorationTheme,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
            borderSide: BorderSide.none,
          ),
        ),
      );

  /// Returns the dark theme
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        indicatorColor: AppColors.greenColor,
        primaryColor: AppColors.mainColor,
        focusColor: AppColors.focusColor,
        scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
        textTheme: _textTheme.copyWith(
          bodyMedium: TextStyle(color: AppColors.darkTextColor),
          headlineMedium: TextStyle(color: AppColors.darkTextColor),
        ),
        hoverColor: AppColors.darkGreyColor,
        // fontFamily: LocaleKeys.lang.tr() == 'en'
        //     ? FontFamily.poppins
        //     : FontFamily.iBMPlexSansArabic,
        hintColor: AppColors.darkGreyColor,
        primaryColorLight: AppColors.darkSecondaryColor,
        primaryColorDark: AppColors.darkTextColor,
        dialogTheme: DialogThemeData(
          elevation: 0,
          backgroundColor: AppColors.darkScaffoldBackgroundColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 24.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        disabledColor: AppColors.darkGreyColor,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.secondaryColor,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: AppColors.darkScaffoldBackgroundColor,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            // fontFamily: LocaleKeys.lang.tr() == 'en'
            //     ? FontFamily.poppins
            //     : FontFamily.iBMPlexSansArabic,
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkScaffoldBackgroundColor,
          selectedItemColor: AppColors.mainColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: AppColors.darkGreyColor),
          unselectedItemColor: AppColors.darkGreyColor,
          enableFeedback: true,
        ),
        radioTheme:
            RadioThemeData(fillColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? AppColors.mainColor
              : AppColors.mainColor;
        })),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1000),
            borderSide: BorderSide.none,
          ),
          iconSize: 24.h,
          backgroundColor: AppColors.mainColor,
          elevation: 1,
        ),
        colorScheme: const ColorScheme.dark(
          primaryContainer: AppColors.primaryContainer,
          secondary: AppColors.secondaryColor,
          primary: AppColors.mainColor,
          error: AppColors.redColor,
        ),
        timePickerTheme: const TimePickerThemeData(
          elevation: 0,
          dialHandColor: AppColors.mainColor,
          dialTextColor: Colors.white,
          backgroundColor: AppColors.darkScaffoldBackgroundColor,
          hourMinuteColor: AppColors.darkScaffoldBackgroundColor,
          dayPeriodTextColor: Colors.white,
          entryModeIconColor: Colors.transparent,
          dialBackgroundColor: AppColors.darkScaffoldBackgroundColor,
          hourMinuteTextColor: Colors.white,
          dayPeriodBorderSide: BorderSide(color: AppColors.mainColor),
        ),
        dividerTheme: const DividerThemeData(color: AppColors.darkGreyColor),
        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: AppStyles.inputDecorationTheme),
        checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r))),
        inputDecorationTheme: AppStyles.inputDecorationTheme.copyWith(
          fillColor: AppColors.darkSecondaryColor,
          hintStyle: TextStyle(color: AppColors.darkGreyColor),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
            borderSide: BorderSide.none,
          ),
        ),
      );

  /// Shared TextTheme for both light and dark modes
  static TextTheme get _textTheme => TextTheme(
        labelLarge: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w600),
        labelMedium: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500),
        headlineSmall: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        labelSmall: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w300),
      );
}
