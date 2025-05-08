import 'package:flutter/material.dart';

/// Comprehensive Sizing Extensions for Flutter
extension SizingExtensions on BuildContext {
  // Screen Dimensions
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenDiagonal => MediaQuery.of(this).size.shortestSide;

  // Safe Area
  EdgeInsets get safeArea => MediaQuery.of(this).padding;
  double get safeAreaTop => MediaQuery.of(this).padding.top;
  double get safeAreaBottom => MediaQuery.of(this).padding.bottom;
  double get safeAreaLeft => MediaQuery.of(this).padding.left;
  double get safeAreaRight => MediaQuery.of(this).padding.right;

  // Status and Navigation Bars
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;
  double get appBarHeight => kToolbarHeight;

  // Keyboard
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
  bool get isKeyboardVisible => keyboardHeight > 0;

  // Device Orientation
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  // Device Type Detection
  bool get isPhone => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;
  bool get isSmallPhone => screenWidth < 360;
  bool get isLargePhone => screenWidth >= 360 && screenWidth < 600;

  // Responsive Breakpoints
  bool get isXSmall => screenWidth < 576;
  bool get isSmall => screenWidth >= 576 && screenWidth < 768;
  bool get isMedium => screenWidth >= 768 && screenWidth < 992;
  bool get isLarge => screenWidth >= 992 && screenWidth < 1200;
  bool get isXLarge => screenWidth >= 1200;

  // Device Density
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  // Responsive Values
  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet) return tablet ?? mobile;
    return mobile;
  }

  double responsiveValue({
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    return responsive<double>(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }

  // Spacing System (Material Design 3)
  double get space0 => 0;
  double get space1 => 4;
  double get space2 => 8;
  double get space3 => 12;
  double get space4 => 16;
  double get space5 => 20;
  double get space6 => 24;
  double get space7 => 28;
  double get space8 => 32;
  double get space9 => 36;
  double get space10 => 40;
  double get space11 => 44;
  double get space12 => 48;
  double get space14 => 56;
  double get space16 => 64;
  double get space20 => 80;
  double get space24 => 96;
  double get space28 => 112;
  double get space32 => 128;

  // Legacy Spacing
  double get xs => space1;
  double get sm => space2;
  double get md => space4;
  double get lg => space6;
  double get xl => space8;
  double get xxl => space12;
  double get xxxl => space16;

  // Responsive Spacing
  double get responsiveXS => responsiveValue(mobile: space1, tablet: space2);
  double get responsiveSM => responsiveValue(mobile: space2, tablet: space3);
  double get responsiveMD => responsiveValue(mobile: space4, tablet: space5);
  double get responsiveLG => responsiveValue(mobile: space6, tablet: space8);
  double get responsiveXL => responsiveValue(mobile: space8, tablet: space10);

  // Percentage-based Sizes
  double widthPercent(double percent) => screenWidth * (percent / 100);
  double heightPercent(double percent) => screenHeight * (percent / 100);

  // Common Size Presets
  double get quarterWidth => screenWidth * 0.25;
  double get halfWidth => screenWidth * 0.5;
  double get threeQuarterWidth => screenWidth * 0.75;
  double get fullWidth => screenWidth;

  double get quarterHeight => screenHeight * 0.25;
  double get halfHeight => screenHeight * 0.5;
  double get threeQuarterHeight => screenHeight * 0.75;
  double get fullHeight => screenHeight;

  // Icon Sizes
  double get iconXS => 12;
  double get iconSM => 16;
  double get iconMD => 20;
  double get iconLG => 24;
  double get iconXL => 32;
  double get iconXXL => 48;
  double get iconXXXL => 64;

  // Avatar Sizes
  double get avatarXS => 24;
  double get avatarSM => 32;
  double get avatarMD => 40;
  double get avatarLG => 48;
  double get avatarXL => 64;
  double get avatarXXL => 96;
  double get avatarXXXL => 128;

  // Button Heights
  double get buttonSM => 32;
  double get buttonMD => 40;
  double get buttonLG => 48;
  double get buttonXL => 56;

  // Input Heights
  double get inputSM => 32;
  double get inputMD => 40;
  double get inputLG => 48;
  double get inputXL => 56;

  // Card Sizes
  double get cardSM => 200;
  double get cardMD => 300;
  double get cardLG => 400;
  double get cardXL => 500;

  // Border Radius System
  BorderRadius get radiusNone => BorderRadius.zero;
  BorderRadius get radiusXS => BorderRadius.circular(2);
  BorderRadius get radiusSM => BorderRadius.circular(4);
  BorderRadius get radiusMD => BorderRadius.circular(8);
  BorderRadius get radiusLG => BorderRadius.circular(12);
  BorderRadius get radiusXL => BorderRadius.circular(16);
  BorderRadius get radiusXXL => BorderRadius.circular(24);
  BorderRadius get radiusXXXL => BorderRadius.circular(32);
  BorderRadius get radiusFull => BorderRadius.circular(9999);

  // Elevation System
  double get elevation0 => 0;
  double get elevation1 => 1;
  double get elevation2 => 2;
  double get elevation3 => 3;
  double get elevation4 => 4;
  double get elevation6 => 6;
  double get elevation8 => 8;
  double get elevation12 => 12;
  double get elevation16 => 16;
  double get elevation24 => 24;

  // Container Constraints
  BoxConstraints get mobileConstraints => BoxConstraints(maxWidth: 600);
  BoxConstraints get tabletConstraints => BoxConstraints(maxWidth: 1024);
  BoxConstraints get desktopConstraints => BoxConstraints(maxWidth: 1200);
  BoxConstraints get maxWidthConstraints =>
      BoxConstraints(maxWidth: screenWidth);

  // Responsive Container Width
  double get containerWidth {
    if (isDesktop) return 1200;
    if (isTablet) return screenWidth * 0.9;
    return screenWidth * 0.95;
  }

  // Grid System
  double gridColumnWidth(int columns, {double spacing = 16}) {
    final totalSpacing = spacing * (columns - 1);
    return (screenWidth - totalSpacing) / columns;
  }

  // Aspect Ratios
  double get aspectRatio16_9 => 16 / 9;
  double get aspectRatio4_3 => 4 / 3;
  double get aspectRatio3_2 => 3 / 2;
  double get aspectRatio1_1 => 1 / 1;
  double get aspectRatioGolden => 1.618;
}

/// Number Extensions for Sizing
extension NumberSizing on num {
  // Convert to SizedBox
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
  SizedBox get square => SizedBox(width: toDouble(), height: toDouble());

  // Convert to EdgeInsets
  EdgeInsets get p => EdgeInsets.all(toDouble());
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get py => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get pt => EdgeInsets.only(top: toDouble());
  EdgeInsets get pb => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get pl => EdgeInsets.only(left: toDouble());
  EdgeInsets get pr => EdgeInsets.only(right: toDouble());

  // Convert to BorderRadius
  BorderRadius get r => BorderRadius.circular(toDouble());
  BorderRadius get rt => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get rb => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );
  BorderRadius get rl => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        bottomLeft: Radius.circular(toDouble()),
      );
  BorderRadius get rr => BorderRadius.only(
        topRight: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );

  // Responsive Scaling
  double scale(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return toDouble() * 0.9;
    if (width < 1024) return toDouble();
    return toDouble() * 1.1;
  }

  // Percentage of screen
  double percentWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * (toDouble() / 100);

  double percentHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * (toDouble() / 100);

  // Duration helpers
  Duration get ms => Duration(milliseconds: toInt());
  Duration get sec => Duration(seconds: toInt());
  Duration get min => Duration(minutes: toInt());

  // Size helpers
  Size get size => Size(toDouble(), toDouble());
  Offset get offset => Offset(toDouble(), toDouble());

  // Constraints
  BoxConstraints get constraints => BoxConstraints.tightFor(
        width: toDouble(),
        height: toDouble(),
      );

  BoxConstraints maxConstraints({double? width, double? height}) =>
      BoxConstraints(
        maxWidth: width ?? toDouble(),
        maxHeight: height ?? toDouble(),
      );

  BoxConstraints minConstraints({double? width, double? height}) =>
      BoxConstraints(
        minWidth: width ?? toDouble(),
        minHeight: height ?? toDouble(),
      );
}

/// Widget Extensions for Sizing
extension WidgetSizing on Widget {
  // Size Constraints
  Widget sized({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
        child: this,
      );

  Widget width(double width) => SizedBox(width: width, child: this);
  Widget height(double height) => SizedBox(height: height, child: this);
  Widget square(double size) =>
      SizedBox(width: size, height: size, child: this);

  // Flexible Sizing
  Widget flex([int flex = 1]) => Flexible(flex: flex, child: this);
  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);

  // Constraints
  Widget constrained({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) =>
      ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minWidth ?? 0,
          maxWidth: maxWidth ?? double.infinity,
          minHeight: minHeight ?? 0,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: this,
      );

  Widget maxWidth(double width) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: this,
      );

  Widget maxHeight(double height) => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height),
        child: this,
      );

  // Responsive Sizing
  Widget responsive(
    BuildContext context, {
    double? mobileWidth,
    double? tabletWidth,
    double? desktopWidth,
    double? mobileHeight,
    double? tabletHeight,
    double? desktopHeight,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    double? width;
    double? height;

    if (screenWidth < 600) {
      width = mobileWidth;
      height = mobileHeight;
    } else if (screenWidth < 1024) {
      width = tabletWidth ?? mobileWidth;
      height = tabletHeight ?? mobileHeight;
    } else {
      width = desktopWidth ?? tabletWidth ?? mobileWidth;
      height = desktopHeight ?? tabletHeight ?? mobileHeight;
    }

    return SizedBox(width: width, height: height, child: this);
  }

  // Aspect Ratio
  Widget aspectRatio(double ratio) => AspectRatio(
        aspectRatio: ratio,
        child: this,
      );

  Widget ratio16_9() => AspectRatio(aspectRatio: 16 / 9, child: this);
  Widget ratio4_3() => AspectRatio(aspectRatio: 4 / 3, child: this);
  Widget ratio1_1() => AspectRatio(aspectRatio: 1, child: this);

  // Intrinsic Dimensions
  Widget intrinsicWidth() => IntrinsicWidth(child: this);
  Widget intrinsicHeight() => IntrinsicHeight(child: this);

  // FittedBox
  Widget fitted({BoxFit fit = BoxFit.contain}) => FittedBox(
        fit: fit,
        child: this,
      );

  Widget fittedWidth() => FittedBox(fit: BoxFit.fitWidth, child: this);
  Widget fittedHeight() => FittedBox(fit: BoxFit.fitHeight, child: this);
}

/// Predefined Size Constants
class AppSizes {
  // Spacing Scale
  static const double space0 = 0;
  static const double space1 = 4;
  static const double space2 = 8;
  static const double space3 = 12;
  static const double space4 = 16;
  static const double space5 = 20;
  static const double space6 = 24;
  static const double space8 = 32;
  static const double space10 = 40;
  static const double space12 = 48;
  static const double space16 = 64;
  static const double space20 = 80;
  static const double space24 = 96;

  // Icon Sizes
  static const double iconXS = 12;
  static const double iconSM = 16;
  static const double iconMD = 20;
  static const double iconLG = 24;
  static const double iconXL = 32;
  static const double iconXXL = 48;

  // Avatar Sizes
  static const double avatarXS = 24;
  static const double avatarSM = 32;
  static const double avatarMD = 40;
  static const double avatarLG = 48;
  static const double avatarXL = 64;
  static const double avatarXXL = 96;

  // Button Heights
  static const double buttonSM = 32;
  static const double buttonMD = 40;
  static const double buttonLG = 48;
  static const double buttonXL = 56;

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1200;

  // Container Widths
  static const double containerSM = 540;
  static const double containerMD = 720;
  static const double containerLG = 960;
  static const double containerXL = 1140;
  static const double containerXXL = 1320;
}
