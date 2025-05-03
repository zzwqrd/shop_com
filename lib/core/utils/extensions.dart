import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ExtensionContext on BuildContext {
  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;

  ThemeData? get theme => Theme.of(this);

  EdgeInsets get padding => MediaQuery.of(this).padding;

  TextStyle get boldText =>
      Theme.of(this).textTheme.labelLarge ?? const TextStyle();
  TextStyle get lightText =>
      Theme.of(this).textTheme.labelSmall ?? const TextStyle();
  TextStyle get mediumText =>
      Theme.of(this).textTheme.labelMedium ?? const TextStyle();
  TextStyle get regularText =>
      Theme.of(this).textTheme.headlineSmall ?? const TextStyle();
  TextStyle get semiboldText =>
      Theme.of(this).textTheme.headlineMedium ?? const TextStyle();

  Color get primaryColor => Theme.of(this).primaryColor;
  Color get highlightColor => Theme.of(this).highlightColor;
  Color get focusColor => Theme.of(this).focusColor;
  Color get splashColor => Theme.of(this).splashColor;
  Color get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get tertiary => Theme.of(this).colorScheme.tertiary;
  Color get disabledColor => Theme.of(this).disabledColor;
  Color get hoverColor => Theme.of(this).hoverColor;
  Color get hintColor => Theme.of(this).hintColor;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color get borderColor =>
      Theme.of(this).dividerTheme.color ?? Theme.of(this).hoverColor;
  Color get tertiaryContainer => Theme.of(this).colorScheme.tertiaryContainer;
  Color get canvasColor => Theme.of(this).canvasColor;
  Color get indicatorColor => Theme.of(this).indicatorColor;

  String get currentRoute => ModalRoute.of(this)?.settings.name ?? "";

  BoxDecoration get primaryDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        color: primaryContainer,
      );

  Map<dynamic, dynamic> get arg =>
      (ModalRoute.of(this)?.settings.arguments ?? {}) as Map<dynamic, dynamic>;
}

extension StringExtention on String {
  Color get color {
    String colorStr = trim();
    if (colorStr.length == 7) colorStr = "FF$colorStr";
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException(
            "An error occurred when converting a color");
      }
    }
    return Color(val);
  }

  bool get isImage {
    final RegExp imageRegex =
        RegExp(r'\.(jpg|jpeg|png|gif|bmp|webp)$', caseSensitive: false);
    return imageRegex.hasMatch(this);
  }

  bool get isVideo {
    final RegExp videoRegex =
        RegExp(r'\.(mp4|mov|wmv|avi|mkv|flv|webm)$', caseSensitive: false);
    return videoRegex.hasMatch(this);
  }

  bool get isPhone => startsWith("5") && length == 9;

  String get toArabicNumber {
    // Create a mapping of English to Arabic numerals
    final englishToArabicMap = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    // Iterate through the characters of the English input and replace with Arabic numerals
    return split('').map((char) {
      return englishToArabicMap[char] ?? char;
    }).join();
  }
}

extension StringExtensions on String {
  /// تقصير النص وإضافة نقاط إذا تجاوز عدد الأحرف المحدد
  String truncate(int maxLength) {
    if (length > maxLength) {
      return '${substring(0, maxLength)}...';
    }
    return this;
  }
}

extension ExtensionWidget on Widget {
  Widget get center => Align(alignment: Alignment.center, child: this);

  Widget withPadding({
    double all = 0.0,
    double vertical = 0.0,
    double horizontal = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    double start = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: all + vertical + top,
        bottom: all + vertical + bottom,
        start: all + horizontal + start,
        end: all + horizontal + end,
      ),
      child: this,
    );
  }

  Widget get toEnd =>
      Align(alignment: AlignmentDirectional.centerEnd, child: this);
  Widget get toStart =>
      Align(alignment: AlignmentDirectional.centerStart, child: this);
  Widget get toBottom => Align(alignment: Alignment.bottomCenter, child: this);
  Widget get toBottomEnd =>
      Align(alignment: AlignmentDirectional.bottomEnd, child: this);
  Widget get toBottomStart =>
      Align(alignment: AlignmentDirectional.bottomStart, child: this);
  Widget get toTopEnd =>
      Align(alignment: AlignmentDirectional.topEnd, child: this);
  Widget get toTopStart =>
      Align(alignment: AlignmentDirectional.topStart, child: this);
  Widget get toTop => Align(alignment: Alignment.topCenter, child: this);
  Widget get withMainAxisSizeMin =>
      Column(mainAxisSize: MainAxisSize.min, children: [this]);
}

extension ExtensionInt on int {
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get months => Duration(days: 30 * this);
  Duration get days => Duration(days: this);
  Duration get hours => Duration(hours: this);
  Duration get minutes => Duration(minutes: this);
  Duration get years => Duration(days: 365 * this);
}

extension ExtensionGlobalKeys on GlobalKey<FormState> {
  bool get isValid => currentState?.validate() ?? false;
}

extension ExtensionDateTime on DateTime {
  bool sameDay(DateTime? other) =>
      year == other?.year && month == other?.month && day == other?.day;
}

// Extension على String لتغيير لون النص
extension TextColorExtension on String {
  // تغيير لون النص باستخدام Color
  Widget colors(Color color) {
    return Text(
      this, // النص الحالي
      style: TextStyle(color: color), // تطبيق اللون المحدد
    );
  }

  // تغيير لون النص مع تحديد حجم الخط
  Widget colorWithSize(Color color, double fontSize) {
    return Text(
      this,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }

  // تغيير لون النص مع تحديد الحجم والخط الغامق
  Widget boldColor(Color color, double fontSize) {
    return Text(
      this,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
