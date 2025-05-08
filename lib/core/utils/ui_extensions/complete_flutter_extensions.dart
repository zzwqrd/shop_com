import 'dart:core';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';

// Color Extensions
extension AppColors on BuildContext {
  // Primary Colors
  Color get primaryColor => const Color(0xFF2196F3);
  Color get primaryLight => const Color(0xFF64B5F6);
  Color get primaryDark => const Color(0xFF1976D2);

  // Secondary Colors
  Color get secondaryColor => const Color(0xFFFF9800);
  Color get secondaryLight => const Color(0xFFFFB74D);
  Color get secondaryDark => const Color(0xFFF57C00);

  // Accent Colors
  Color get accentColor => const Color(0xFF9C27B0);
  Color get accentLight => const Color(0xFFBA68C8);
  Color get accentDark => const Color(0xFF7B1FA2);

  // Neutral Colors
  Color get backgroundColor => const Color(0xFFF5F5F5);
  Color get surfaceColor => Colors.white;
  Color get cardColor => Colors.white;
  Color get dividerColor => const Color(0xFFE0E0E0);
  Color get scaffoldColor => const Color(0xFFFAFAFA);

  // Text Colors
  Color get textPrimary => const Color(0xFF212121);
  Color get textSecondary => const Color(0xFF757575);
  Color get textHint => const Color(0xFFBDBDBD);
  Color get textDisabled => const Color(0xFF9E9E9E);
  Color get textOnPrimary => Colors.white;
  Color get textOnSecondary => Colors.white;

  // Status Colors
  Color get successColor => const Color(0xFF4CAF50);
  Color get successLight => const Color(0xFF81C784);
  Color get successDark => const Color(0xFF388E3C);

  Color get errorColor => const Color(0xFFF44336);
  Color get errorLight => const Color(0xFFE57373);
  Color get errorDark => const Color(0xFFD32F2F);

  Color get warningColor => const Color(0xFFFF9800);
  Color get warningLight => const Color(0xFFFFB74D);
  Color get warningDark => const Color(0xFFF57C00);

  Color get infoColor => const Color(0xFF2196F3);
  Color get infoLight => const Color(0xFF64B5F6);
  Color get infoDark => const Color(0xFF1976D2);

  // Gradient Colors
  LinearGradient get primaryGradient => LinearGradient(
        colors: [primaryColor, primaryLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get secondaryGradient => LinearGradient(
        colors: [secondaryColor, secondaryLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get successGradient => LinearGradient(
        colors: [successColor, successLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get errorGradient => LinearGradient(
        colors: [errorColor, errorLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get warningGradient => LinearGradient(
        colors: [warningColor, warningLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get infoGradient => LinearGradient(
        colors: [infoColor, infoLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  // Special Gradients
  LinearGradient get sunsetGradient => const LinearGradient(
        colors: [Color(0xFFFF7043), Color(0xFFFFAB40)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get oceanGradient => const LinearGradient(
        colors: [Color(0xFF0277BD), Color(0xFF00BCD4)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  LinearGradient get forestGradient => const LinearGradient(
        colors: [Color(0xFF388E3C), Color(0xFF66BB6A)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}

// Text Style Extensions
extension AppTextStyles on BuildContext {
  // Display Styles (Extra Large)
  TextStyle get displayLarge => const TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 1.12,
        letterSpacing: -0.25,
      );

  TextStyle get displayMedium => const TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        height: 1.16,
        letterSpacing: 0,
      );

  TextStyle get displaySmall => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 1.22,
        letterSpacing: 0,
      );

  // Headlines
  TextStyle get headlineLarge => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.25,
        letterSpacing: 0,
      );

  TextStyle get headlineMedium => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.29,
        letterSpacing: 0,
      );

  TextStyle get headlineSmall => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0,
      );

  // Titles
  TextStyle get titleLarge => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.27,
        letterSpacing: 0,
      );

  TextStyle get titleMedium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.50,
        letterSpacing: 0.15,
      );

  TextStyle get titleSmall => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      );

  // Body Text
  TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.50,
        letterSpacing: 0.5,
      );

  TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      );

  TextStyle get bodySmall => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.4,
      );

  // Labels
  TextStyle get labelLarge => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      );

  TextStyle get labelMedium => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.5,
      );

  TextStyle get labelSmall => const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.45,
        letterSpacing: 0.5,
      );

  // Legacy Support (for backward compatibility)
  TextStyle get h1 => headlineLarge.copyWith(fontWeight: FontWeight.bold);
  TextStyle get h2 => headlineMedium.copyWith(fontWeight: FontWeight.bold);
  TextStyle get h3 => headlineSmall.copyWith(fontWeight: FontWeight.w600);
  TextStyle get h4 => titleLarge.copyWith(fontWeight: FontWeight.w600);
  TextStyle get h5 => titleMedium.copyWith(fontWeight: FontWeight.w500);
  TextStyle get h6 => titleSmall.copyWith(fontWeight: FontWeight.w500);

  TextStyle get caption => labelSmall;
  TextStyle get overline => labelSmall.copyWith(letterSpacing: 1.5);
  TextStyle get button => labelLarge.copyWith(letterSpacing: 1.25);
}

// Sizing Extensions
extension AppSizing on BuildContext {
  // Screen Dimensions
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  // Safe Area
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;
  double get safeAreaTop => MediaQuery.of(this).padding.top;
  double get safeAreaBottom => MediaQuery.of(this).padding.bottom;

  // Responsive Breakpoints
  bool get isSmallMobile => screenWidth < 360;
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;
  bool get isLandscape => screenWidth > screenHeight;
  bool get isPortrait => screenHeight > screenWidth;

  // Device Type
  bool get isPhone => isMobile && !isTablet;
  bool get isTabletPortrait => isTablet && isPortrait;
  bool get isTabletLandscape => isTablet && isLandscape;

  // Spacing System (Material Design 3)
  double get spacing0 => 0.0;
  double get spacing1 => 4.0;
  double get spacing2 => 8.0;
  double get spacing3 => 12.0;
  double get spacing4 => 16.0;
  double get spacing5 => 20.0;
  double get spacing6 => 24.0;
  double get spacing7 => 28.0;
  double get spacing8 => 32.0;
  double get spacing9 => 36.0;
  double get spacing10 => 40.0;
  double get spacing12 => 48.0;
  double get spacing16 => 64.0;
  double get spacing20 => 80.0;
  double get spacing24 => 96.0;

  // Legacy Spacing (for backward compatibility)
  double get xs => spacing1;
  double get sm => spacing2;
  double get md => spacing4;
  double get lg => spacing6;
  double get xl => spacing8;
  double get xxl => spacing12;
  double get xxxl => spacing16;

  // Responsive Spacing
  double get responsiveXS => isMobile ? spacing1 : spacing2;
  double get responsiveSM => isMobile ? spacing2 : spacing3;
  double get responsiveMD => isMobile ? spacing4 : spacing5;
  double get responsiveLG => isMobile ? spacing6 : spacing8;
  double get responsiveXL => isMobile ? spacing8 : spacing10;

  // Padding Shortcuts
  EdgeInsets get padding0 => EdgeInsets.all(spacing0);
  EdgeInsets get padding1 => EdgeInsets.all(spacing1);
  EdgeInsets get padding2 => EdgeInsets.all(spacing2);
  EdgeInsets get padding3 => EdgeInsets.all(spacing3);
  EdgeInsets get padding4 => EdgeInsets.all(spacing4);
  EdgeInsets get padding5 => EdgeInsets.all(spacing5);
  EdgeInsets get padding6 => EdgeInsets.all(spacing6);
  EdgeInsets get padding8 => EdgeInsets.all(spacing8);
  EdgeInsets get padding10 => EdgeInsets.all(spacing10);
  EdgeInsets get padding12 => EdgeInsets.all(spacing12);

  // Legacy Padding
  EdgeInsets get paddingXS => EdgeInsets.all(xs);
  EdgeInsets get paddingSM => EdgeInsets.all(sm);
  EdgeInsets get paddingMD => EdgeInsets.all(md);
  EdgeInsets get paddingLG => EdgeInsets.all(lg);
  EdgeInsets get paddingXL => EdgeInsets.all(xl);
  EdgeInsets get paddingXXL => EdgeInsets.all(xxl);

  // Horizontal Padding
  EdgeInsets get paddingHorizontal1 =>
      EdgeInsets.symmetric(horizontal: spacing1);
  EdgeInsets get paddingHorizontal2 =>
      EdgeInsets.symmetric(horizontal: spacing2);
  EdgeInsets get paddingHorizontal3 =>
      EdgeInsets.symmetric(horizontal: spacing3);
  EdgeInsets get paddingHorizontal4 =>
      EdgeInsets.symmetric(horizontal: spacing4);
  EdgeInsets get paddingHorizontal5 =>
      EdgeInsets.symmetric(horizontal: spacing5);
  EdgeInsets get paddingHorizontal6 =>
      EdgeInsets.symmetric(horizontal: spacing6);
  EdgeInsets get paddingHorizontal8 =>
      EdgeInsets.symmetric(horizontal: spacing8);

  // Legacy Horizontal Padding
  EdgeInsets get paddingHorizontalXS => EdgeInsets.symmetric(horizontal: xs);
  EdgeInsets get paddingHorizontalSM => EdgeInsets.symmetric(horizontal: sm);
  EdgeInsets get paddingHorizontalMD => EdgeInsets.symmetric(horizontal: md);
  EdgeInsets get paddingHorizontalLG => EdgeInsets.symmetric(horizontal: lg);
  EdgeInsets get paddingHorizontalXL => EdgeInsets.symmetric(horizontal: xl);

  // Vertical Padding
  EdgeInsets get paddingVertical1 => EdgeInsets.symmetric(vertical: spacing1);
  EdgeInsets get paddingVertical2 => EdgeInsets.symmetric(vertical: spacing2);
  EdgeInsets get paddingVertical3 => EdgeInsets.symmetric(vertical: spacing3);
  EdgeInsets get paddingVertical4 => EdgeInsets.symmetric(vertical: spacing4);
  EdgeInsets get paddingVertical5 => EdgeInsets.symmetric(vertical: spacing5);
  EdgeInsets get paddingVertical6 => EdgeInsets.symmetric(vertical: spacing6);
  EdgeInsets get paddingVertical8 => EdgeInsets.symmetric(vertical: spacing8);

  // Legacy Vertical Padding
  EdgeInsets get paddingVerticalXS => EdgeInsets.symmetric(vertical: xs);
  EdgeInsets get paddingVerticalSM => EdgeInsets.symmetric(vertical: sm);
  EdgeInsets get paddingVerticalMD => EdgeInsets.symmetric(vertical: md);
  EdgeInsets get paddingVerticalLG => EdgeInsets.symmetric(vertical: lg);
  EdgeInsets get paddingVerticalXL => EdgeInsets.symmetric(vertical: xl);

  // Border Radius System
  BorderRadius get radius0 => BorderRadius.circular(0);
  BorderRadius get radius1 => BorderRadius.circular(4);
  BorderRadius get radius2 => BorderRadius.circular(8);
  BorderRadius get radius3 => BorderRadius.circular(12);
  BorderRadius get radius4 => BorderRadius.circular(16);
  BorderRadius get radius5 => BorderRadius.circular(20);
  BorderRadius get radius6 => BorderRadius.circular(24);
  BorderRadius get radius8 => BorderRadius.circular(32);
  BorderRadius get radiusFull => BorderRadius.circular(9999);

  // Legacy Radius
  BorderRadius get radiusXS => radius1;
  BorderRadius get radiusSM => radius2;
  BorderRadius get radiusMD => radius3;
  BorderRadius get radiusLG => radius4;
  BorderRadius get radiusXL => radius5;
  BorderRadius get radiusXXL => radius6;
  BorderRadius get radiusRounded => radiusFull;

  // Special Radius
  BorderRadius get radiusTopOnly => BorderRadius.only(
        topLeft: Radius.circular(radius3.topLeft.x),
        topRight: Radius.circular(radius3.topRight.x),
      );

  BorderRadius get radiusBottomOnly => BorderRadius.only(
        bottomLeft: Radius.circular(radius3.bottomLeft.x),
        bottomRight: Radius.circular(radius3.bottomRight.x),
      );

  BorderRadius get radiusLeftOnly => BorderRadius.only(
        topLeft: Radius.circular(radius3.topLeft.x),
        bottomLeft: Radius.circular(radius3.bottomLeft.x),
      );

  BorderRadius get radiusRightOnly => BorderRadius.only(
        topRight: Radius.circular(radius3.topRight.x),
        bottomRight: Radius.circular(radius3.bottomRight.x),
      );

  // Icon Sizes
  double get icon12 => 12.0;
  double get icon16 => 16.0;
  double get icon20 => 20.0;
  double get icon24 => 24.0;
  double get icon28 => 28.0;
  double get icon32 => 32.0;
  double get icon36 => 36.0;
  double get icon40 => 40.0;
  double get icon48 => 48.0;
  double get icon56 => 56.0;
  double get icon64 => 64.0;

  // Legacy Icon Sizes
  double get iconXS => icon16;
  double get iconSM => icon20;
  double get iconMD => icon24;
  double get iconLG => icon32;
  double get iconXL => icon48;
  double get iconXXL => icon64;

  // Avatar Sizes
  double get avatar24 => 24.0;
  double get avatar32 => 32.0;
  double get avatar40 => 40.0;
  double get avatar48 => 48.0;
  double get avatar56 => 56.0;
  double get avatar64 => 64.0;
  double get avatar80 => 80.0;
  double get avatar96 => 96.0;
  double get avatar128 => 128.0;

  // Legacy Avatar Sizes
  double get avatarSM => avatar32;
  double get avatarMD => avatar48;
  double get avatarLG => avatar64;
  double get avatarXL => avatar96;

  // Button Heights
  double get buttonSmall => 32.0;
  double get buttonMedium => 40.0;
  double get buttonLarge => 48.0;
  double get buttonExtraLarge => 56.0;

  // Input Heights
  double get inputSmall => 32.0;
  double get inputMedium => 40.0;
  double get inputLarge => 48.0;

  // Elevation System
  double get elevation0 => 0.0;
  double get elevation1 => 1.0;
  double get elevation2 => 2.0;
  double get elevation3 => 3.0;
  double get elevation4 => 4.0;
  double get elevation6 => 6.0;
  double get elevation8 => 8.0;
  double get elevation12 => 12.0;
  double get elevation16 => 16.0;
  double get elevation24 => 24.0;
}

// Enhanced Image Extensions
extension AppImages on BuildContext {
  // Network Image with comprehensive options
  Widget networkImage(
    String url, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
    BorderRadius? borderRadius,
    Color? color,
    BlendMode? colorBlendMode,
    double? opacity,
    Duration fadeInDuration = const Duration(milliseconds: 300),
    Duration placeholderFadeInDuration = const Duration(milliseconds: 300),
    Map<String, String>? httpHeaders,
    bool useOldImageOnUrlChange = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    Widget imageWidget = CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      color: color,
      colorBlendMode: colorBlendMode,
      fadeInDuration: fadeInDuration,
      placeholderFadeInDuration: placeholderFadeInDuration,
      httpHeaders: httpHeaders,
      useOldImageOnUrlChange: useOldImageOnUrlChange,
      filterQuality: filterQuality,
      placeholder: (context, url) =>
          placeholder ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                ),
              ),
            ),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.broken_image_outlined,
                  color: textHint,
                  size: iconMD,
                ),
                if (height == null || height > 60) ...[
                  SizedBox(height: spacing1),
                  Text(
                    'فشل تحميل الصورة',
                    style: labelSmall.copyWith(color: textHint),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
    );

    if (opacity != null) {
      imageWidget = Opacity(opacity: opacity, child: imageWidget);
    }

    if (borderRadius != null) {
      imageWidget = ClipRRect(
        borderRadius: borderRadius,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  // Enhanced Asset Image
  Widget assetImage(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    BlendMode? colorBlendMode,
    BorderRadius? borderRadius,
    double? opacity,
    FilterQuality filterQuality = FilterQuality.low,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    Alignment alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Widget? errorWidget,
  }) {
    Widget imageWidget;

    try {
      imageWidget = Image.asset(
        path,
        width: width,
        height: height,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
        filterQuality: filterQuality,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        alignment: alignment,
        repeat: repeat,
        errorBuilder: errorWidget != null
            ? (context, error, stackTrace) => errorWidget
            : (context, error, stackTrace) => Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported_outlined,
                        color: textHint,
                        size: iconMD,
                      ),
                      if (height == null || height > 60) ...[
                        SizedBox(height: spacing1),
                        Text(
                          'الصورة غير موجودة',
                          style: labelSmall.copyWith(color: textHint),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
      );
    } catch (e) {
      imageWidget = errorWidget ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
            child: Icon(
              Icons.image_not_supported_outlined,
              color: textHint,
              size: iconMD,
            ),
          );
    }

    if (opacity != null) {
      imageWidget = Opacity(opacity: opacity, child: imageWidget);
    }

    if (borderRadius != null) {
      imageWidget = ClipRRect(
        borderRadius: borderRadius,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  // Circular Image (Avatar)
  Widget circularImage(
    String imageUrl, {
    double radius = 24,
    Widget? placeholder,
    Widget? errorWidget,
    Color? backgroundColor,
    bool isAsset = false,
    Border? border,
    List<BoxShadow>? boxShadow,
    VoidCallback? onTap,
  }) {
    Widget avatar = Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? this.backgroundColor,
        border: border,
        boxShadow: boxShadow,
      ),
      child: ClipOval(
        child: imageUrl.isEmpty
            ? (placeholder ??
                Icon(
                  Icons.person,
                  size: radius,
                  color: textHint,
                ))
            : isAsset
                ? assetImage(
                    imageUrl,
                    width: radius * 2,
                    height: radius * 2,
                    fit: BoxFit.cover,
                    errorWidget: placeholder ??
                        Icon(
                          Icons.person,
                          size: radius,
                          color: textHint,
                        ),
                  )
                : networkImage(
                    imageUrl,
                    width: radius * 2,
                    height: radius * 2,
                    fit: BoxFit.cover,
                    placeholder: placeholder,
                    errorWidget: errorWidget ??
                        placeholder ??
                        Icon(
                          Icons.person,
                          size: radius,
                          color: textHint,
                        ),
                  ),
      ),
    );

    if (onTap != null) {
      avatar = GestureDetector(
        onTap: onTap,
        child: avatar,
      );
    }

    return avatar;
  }

  // Image with overlay and effects
  Widget imageWithOverlay(
    String imageUrl, {
    double? width,
    double? height,
    Widget? overlay,
    Color? overlayColor,
    double overlayOpacity = 0.3,
    BorderRadius? borderRadius,
    bool isAsset = false,
    BoxFit fit = BoxFit.cover,
    List<BoxShadow>? boxShadow,
    Gradient? overlayGradient,
    AlignmentGeometry overlayAlignment = Alignment.center,
  }) {
    Widget imageWidget = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Stack(
          children: [
            // Base Image
            isAsset
                ? assetImage(
                    imageUrl,
                    width: width,
                    height: height,
                    fit: fit,
                  )
                : networkImage(
                    imageUrl,
                    width: width,
                    height: height,
                    fit: fit,
                  ),

            // Color Overlay
            if (overlayColor != null)
              Container(
                width: width,
                height: height,
                color: overlayColor.withOpacity(overlayOpacity),
              ),

            // Gradient Overlay
            if (overlayGradient != null)
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  gradient: overlayGradient,
                ),
              ),

            // Custom Overlay Widget
            if (overlay != null)
              Positioned.fill(
                child: Align(
                  alignment: overlayAlignment,
                  child: overlay,
                ),
              ),
          ],
        ),
      ),
    );

    return imageWidget;
  }

  // Hero Image for page transitions
  Widget heroImage(
    String imageUrl, {
    required String heroTag,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
    bool isAsset = false,
    VoidCallback? onTap,
    Widget? child,
  }) {
    Widget heroWidget = Hero(
      tag: heroTag,
      child: isAsset
          ? assetImage(
              imageUrl,
              width: width,
              height: height,
              fit: fit,
              borderRadius: borderRadius,
            )
          : networkImage(
              imageUrl,
              width: width,
              height: height,
              fit: fit,
              borderRadius: borderRadius,
            ),
    );

    if (child != null) {
      heroWidget = Stack(
        children: [
          heroWidget,
          if (child != null) Positioned.fill(child: child),
        ],
      );
    }

    if (onTap != null) {
      heroWidget = GestureDetector(
        onTap: onTap,
        child: heroWidget,
      );
    }

    return heroWidget;
  }

  // Gallery Image Item
  Widget galleryImage(
    String imageUrl, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
    bool isAsset = false,
    VoidCallback? onTap,
    Widget? badge,
    Widget? overlay,
    bool showLoadingIndicator = true,
    String? heroTag,
  }) {
    Widget imageWidget = GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? radiusMD,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? radiusMD,
          child: Stack(
            children: [
              // Base Image
              isAsset
                  ? assetImage(
                      imageUrl,
                      width: width,
                      height: height,
                      fit: fit,
                    )
                  : networkImage(
                      imageUrl,
                      width: width,
                      height: height,
                      fit: fit,
                    ),

              // Overlay
              if (overlay != null) Positioned.fill(child: overlay),

              // Badge
              if (badge != null)
                Positioned(
                  top: spacing2,
                  right: spacing2,
                  child: badge,
                ),
            ],
          ),
        ),
      ),
    );

    // Wrap with Hero if heroTag is provided
    if (heroTag != null) {
      imageWidget = Hero(
        tag: heroTag,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  // Profile Avatar with status and edit functionality
  Widget profileAvatar(
    String? imageUrl, {
    double radius = 50,
    bool isOnline = false,
    Color onlineColor = Colors.green,
    bool isAsset = false,
    Border? border,
    VoidCallback? onTap,
    VoidCallback? onEdit,
    bool showEditIcon = false,
    Widget? placeholder,
    Widget? badge,
    List<BoxShadow>? boxShadow,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Main Avatar
          circularImage(
            imageUrl ?? '',
            radius: radius,
            isAsset: isAsset,
            border: border,
            boxShadow: boxShadow,
            placeholder: placeholder ??
                Icon(
                  Icons.person,
                  size: radius,
                  color: textHint,
                ),
          ),

          // Online Status Indicator
          if (isOnline)
            Positioned(
              bottom: radius * 0.1,
              right: radius * 0.1,
              child: Container(
                width: radius * 0.3,
                height: radius * 0.3,
                decoration: BoxDecoration(
                  color: onlineColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: surfaceColor,
                    width: 2,
                  ),
                ),
              ),
            ),

          // Edit Icon
          if (showEditIcon && onEdit != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onEdit,
                child: Container(
                  padding: EdgeInsets.all(spacing1),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: surfaceColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.edit,
                    size: radius * 0.25,
                    color: textOnPrimary,
                  ),
                ),
              ),
            ),

          // Custom Badge
          if (badge != null)
            Positioned(
              top: 0,
              right: 0,
              child: badge,
            ),
        ],
      ),
    );
  }

  // Image Carousel Item
  Widget carouselImage(
    String imageUrl, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
    bool isAsset = false,
    Widget? overlay,
    VoidCallback? onTap,
    String? caption,
    int? index,
    int? totalCount,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Stack(
            children: [
              // Base Image
              isAsset
                  ? assetImage(
                      imageUrl,
                      width: width,
                      height: height,
                      fit: fit,
                    )
                  : networkImage(
                      imageUrl,
                      width: width,
                      height: height,
                      fit: fit,
                    ),

              // Overlay
              if (overlay != null) Positioned.fill(child: overlay),

              // Index Indicator
              if (index != null && totalCount != null)
                Positioned(
                  top: spacing2,
                  right: spacing2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: spacing2,
                      vertical: spacing1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: radius2,
                    ),
                    child: Text(
                      '${index + 1}/$totalCount',
                      style: labelSmall.copyWith(color: Colors.white),
                    ),
                  ),
                ),

              // Caption
              if (caption != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(spacing3),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Text(
                      caption,
                      style: bodySmall.copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Thumbnail Image
  Widget thumbnailImage(
    String imageUrl, {
    double size = 60,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
    bool isAsset = false,
    VoidCallback? onTap,
    bool isSelected = false,
    Color? selectionColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? radius2,
          border: isSelected
              ? Border.all(
                  color: selectionColor ?? primaryColor,
                  width: 2,
                )
              : null,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? radius2,
          child: isAsset
              ? assetImage(
                  imageUrl,
                  width: size,
                  height: size,
                  fit: fit,
                )
              : networkImage(
                  imageUrl,
                  width: size,
                  height: size,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}

// List Extensions
extension ListExtensions<T> on List<T> {
  // Convert list to Column
  Widget column({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
  }) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        verticalDirection: verticalDirection,
        textDirection: textDirection,
        textBaseline: textBaseline,
        children: map((e) => e as Widget).toList(),
      );

  // Convert list to Row
  Widget row({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) =>
      Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: map((e) => e as Widget).toList(),
      );

  // Convert list to Wrap
  Widget wrap({
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 0.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 0.0,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Clip clipBehavior = Clip.none,
  }) =>
      Wrap(
        direction: direction,
        alignment: alignment,
        spacing: spacing,
        runAlignment: runAlignment,
        runSpacing: runSpacing,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        clipBehavior: clipBehavior,
        children: map((e) => e as Widget).toList(),
      );

  // Convert list to ListView
  Widget listView({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ListView(
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        itemExtent: itemExtent,
        prototypeItem: prototypeItem,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        children: map((e) => e as Widget).toList(),
      );

  // Convert list to GridView
  Widget gridView({
    required SliverGridDelegate gridDelegate,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
  }) =>
      GridView(
        gridDelegate: gridDelegate,
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        children: map((e) => e as Widget).toList(),
      );

  // Convert list to PageView
  Widget pageView({
    Axis scrollDirection = Axis.horizontal,
    bool reverse = false,
    PageController? controller,
    ScrollPhysics? physics,
    bool pageSnapping = true,
    ValueChanged<int>? onPageChanged,
    bool allowImplicitScrolling = false,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
    ScrollBehavior? scrollBehavior,
    bool padEnds = true,
  }) =>
      PageView(
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        physics: physics,
        pageSnapping: pageSnapping,
        onPageChanged: onPageChanged,
        allowImplicitScrolling: allowImplicitScrolling,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        scrollBehavior: scrollBehavior,
        padEnds: padEnds,
        children: map((e) => e as Widget).toList(),
      );

  // Separated list widgets
  Widget separatedColumn({
    required Widget separator,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    if (isEmpty) return const SizedBox.shrink();

    final List<Widget> widgets = [];
    for (int i = 0; i < length; i++) {
      widgets.add(this[i] as Widget);
      if (i < length - 1) {
        widgets.add(separator);
      }
    }

    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: widgets,
    );
  }

  Widget separatedRow({
    required Widget separator,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    if (isEmpty) return const SizedBox.shrink();

    final List<Widget> widgets = [];
    for (int i = 0; i < length; i++) {
      widgets.add(this[i] as Widget);
      if (i < length - 1) {
        widgets.add(separator);
      }
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: widgets,
    );
  }

  // Animated list
  // Widget animatedList({
  //   required AnimatedListItemBuilder itemBuilder,
  //   Axis scrollDirection = Axis.vertical,
  //   bool reverse = false,
  //   AnimatedListController? controller,
  //   bool? primary,
  //   ScrollPhysics? physics,
  //   bool shrinkWrap = false,
  //   EdgeInsetsGeometry? padding,
  //   Clip clipBehavior = Clip.hardEdge,
  // }) =>
  //     AnimatedList(
  //       itemBuilder: itemBuilder,
  //       initialItemCount: length,
  //       scrollDirection: scrollDirection,
  //       reverse: reverse,
  //       controller: controller,
  //       primary: primary,
  //       physics: physics,
  //       shrinkWrap: shrinkWrap,
  //       padding: padding,
  //       clipBehavior: clipBehavior,
  //     );

  // Staggered animations
  Widget staggeredColumn({
    Duration delay = const Duration(milliseconds: 100),
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: asMap().entries.map((entry) {
        final index = entry.key;
        final widget = entry.value as Widget;

        return AnimatedContainer(
          duration: duration,
          curve: curve,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: duration + (delay * index),
            curve: curve,
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: Opacity(
                  opacity: value,
                  child: widget,
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }

  // Utility methods
  Widget get columnSpaced =>
      separatedColumn(separator: const SizedBox(height: 8));
  Widget get rowSpaced => separatedRow(separator: const SizedBox(width: 8));

  // Grid helpers
  Widget gridCount(int crossAxisCount, {double spacing = 8}) => gridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
      );

  Widget gridExtent(double maxCrossAxisExtent, {double spacing = 8}) =>
      gridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
      );
}

// Box Decoration Extensions
extension AppDecorations on BuildContext {
  // Card Decorations
  BoxDecoration get cardDecoration => BoxDecoration(
        color: surfaceColor,
        borderRadius: radiusMD,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );

  BoxDecoration get elevatedCardDecoration => BoxDecoration(
        color: surfaceColor,
        borderRadius: radiusMD,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      );

  BoxDecoration get floatingCardDecoration => BoxDecoration(
        color: surfaceColor,
        borderRadius: radiusLG,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      );

  // Button Decorations
  BoxDecoration get primaryButtonDecoration => BoxDecoration(
        gradient: primaryGradient,
        borderRadius: radiusSM,
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );

  BoxDecoration get secondaryButtonDecoration => BoxDecoration(
        border: Border.all(color: primaryColor, width: 1.5),
        borderRadius: radiusSM,
        color: Colors.transparent,
      );

  BoxDecoration get ghostButtonDecoration => BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: radiusSM,
      );

  BoxDecoration get dangerButtonDecoration => BoxDecoration(
        gradient: errorGradient,
        borderRadius: radiusSM,
        boxShadow: [
          BoxShadow(
            color: errorColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );

  BoxDecoration get successButtonDecoration => BoxDecoration(
        gradient: successGradient,
        borderRadius: radiusSM,
        boxShadow: [
          BoxShadow(
            color: successColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );

  // Input Decorations
  InputDecoration get inputDecoration => InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: dividerColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: errorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: paddingMD,
      );

  InputDecoration get searchInputDecoration => InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        hintText: 'البحث...',
        prefixIcon: Icon(Icons.search, color: textHint),
        border: OutlineInputBorder(
          borderRadius: radiusRounded,
          borderSide: BorderSide.none,
        ),
        contentPadding: paddingHorizontalMD,
      );

  InputDecoration get outlinedInputDecoration => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: errorColor, width: 2),
        ),
        contentPadding: paddingMD,
      );

  // Container Decorations
  BoxDecoration containerDecoration({
    Color? color,
    BorderRadius? borderRadius,
    Border? border,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
  }) =>
      BoxDecoration(
        color: color ?? surfaceColor,
        borderRadius: borderRadius ?? radiusMD,
        border: border,
        boxShadow: boxShadow,
        gradient: gradient,
      );

  // Shimmer Decoration
  BoxDecoration get shimmerDecoration => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColor,
            backgroundColor.withOpacity(0.5),
            backgroundColor,
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: radiusSM,
      );
}

// Enhanced Widget Extensions
extension WidgetExtensions on Widget {
  // Padding Extensions with context
  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  // Context-aware padding
  Widget paddingContext(
    BuildContext context, {
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    EdgeInsets padding;

    if (all != null) {
      padding = EdgeInsets.all(all);
    } else if (horizontal != null || vertical != null) {
      padding = EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      );
    } else {
      padding = EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      );
    }

    return Padding(padding: padding, child: this);
  }

  // Margin Extensions
  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );

  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Container(
        margin:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );

  // Decoration Extensions
  Widget decorated(BoxDecoration decoration) => Container(
        decoration: decoration,
        child: this,
      );

  Widget withBackground(Color color) => Container(
        color: color,
        child: this,
      );

  Widget withBorder({
    Color color = Colors.grey,
    double width = 1,
    BorderRadius? borderRadius,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
          borderRadius: borderRadius,
        ),
        child: this,
      );

  Widget withShadow({
    Color color = Colors.black,
    double opacity = 0.1,
    double blurRadius = 8,
    Offset offset = const Offset(0, 2),
    BorderRadius? borderRadius,
  }) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(opacity),
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        ),
        child: this,
      );

  // Sizing Extensions
  Widget sized({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
        child: this,
      );

  Widget square(double size) => SizedBox(
        width: size,
        height: size,
        child: this,
      );

  Widget width(double width) => SizedBox(width: width, child: this);
  Widget height(double height) => SizedBox(height: height, child: this);

  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);
  Widget flexible([int flex = 1]) => Flexible(flex: flex, child: this);

  Widget intrinsicWidth() => IntrinsicWidth(child: this);
  Widget intrinsicHeight() => IntrinsicHeight(child: this);

  Widget constrainedBox({
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

  // Alignment Extensions
  Widget centered() => Center(child: this);
  Widget aligned(Alignment alignment) =>
      Align(alignment: alignment, child: this);

  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? width,
    double? height,
  }) =>
      Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        width: width,
        height: height,
        child: this,
      );

  Widget positionedFill({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) =>
      Positioned.fill(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        child: this,
      );

  // Gesture Extensions
  Widget onTap(VoidCallback onTap, {BorderRadius? borderRadius}) => InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: this,
      );

  Widget onLongPress(VoidCallback onLongPress, {BorderRadius? borderRadius}) =>
      InkWell(
        onLongPress: onLongPress,
        borderRadius: borderRadius,
        child: this,
      );

  Widget onDoubleTap(VoidCallback onDoubleTap, {BorderRadius? borderRadius}) =>
      InkWell(
        onDoubleTap: onDoubleTap,
        borderRadius: borderRadius,
        child: this,
      );

  // Widget gestureDetector({
  //   VoidCallback? onTap,
  //   VoidCallback? onDoubleTap,
  //   VoidCallback? onLongPress,
  //   GestureTapDownCallback? onTapDown,
  //   GestureTapUpCallback? onTapUp,
  //   GestureTapCancelCallback? onTapCancel,
  //   ValueChanged<bool>? onHighlightChanged,
  //   ValueChanged<bool>? onHover,
  //   GesturePanStartCallback? onPanStart,
  //   GesturePanUpdateCallback? onPanUpdate,
  //   GesturePanEndCallback? onPanEnd,
  //   HitTestBehavior? behavior,
  // }) =>
  //     GestureDetector(
  //       onTap: onTap,
  //       onDoubleTap: onDoubleTap,
  //       onLongPress: onLongPress,
  //       onTapDown: onTapDown,
  //       onTapUp: onTapUp,
  //       onTapCancel: onTapCancel,
  //       onPanStart: onPanStart,
  //       onPanUpdate: onPanUpdate,
  //       onPanEnd: onPanEnd,
  //       behavior: behavior,
  //       child: this,
  //     );

  // Animation Extensions
  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeIn,
    double begin = 0.0,
    double end = 1.0,
  }) =>
      TweenAnimationBuilder<double>(
        tween: Tween(begin: begin, end: end),
        duration: duration,
        curve: curve,
        builder: (context, value, child) => Opacity(
          opacity: value,
          child: this,
        ),
      );

  Widget slideIn({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
    Offset begin = const Offset(0, 1),
    Offset end = Offset.zero,
  }) =>
      TweenAnimationBuilder<Offset>(
        tween: Tween(begin: begin, end: end),
        duration: duration,
        curve: curve,
        builder: (context, value, child) => Transform.translate(
          offset: value,
          child: this,
        ),
      );

  Widget scaleIn({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
    double begin = 0.0,
    double end = 1.0,
  }) =>
      TweenAnimationBuilder<double>(
        tween: Tween(begin: begin, end: end),
        duration: duration,
        curve: curve,
        builder: (context, value, child) => Transform.scale(
          scale: value,
          child: this,
        ),
      );

  Widget rotateIn({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeOut,
    double begin = 0.0,
    double end = 1.0,
  }) =>
      TweenAnimationBuilder<double>(
        tween: Tween(begin: begin, end: end),
        duration: duration,
        curve: curve,
        builder: (context, value, child) => Transform.rotate(
          angle: value * 2 * 3.14159,
          child: this,
        ),
      );

  // Visibility Extensions
  Widget visible(bool isVisible) => Visibility(
        visible: isVisible,
        child: this,
      );

  Widget opacity(double opacity) => Opacity(
        opacity: opacity,
        child: this,
      );

  Widget conditional(bool condition, [Widget? fallback]) =>
      condition ? this : fallback ?? const SizedBox.shrink();

  // Scrollable Extensions
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollPhysics? physics,
    ScrollController? controller,
    EdgeInsets? padding,
  }) =>
      SingleChildScrollView(
        scrollDirection: scrollDirection,
        reverse: reverse,
        physics: physics,
        controller: controller,
        padding: padding,
        child: this,
      );

  // Card Extensions
  Widget asCard({
    Color? color,
    double? elevation,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
    Clip? clipBehavior,
    bool borderOnForeground = true,
  }) =>
      Card(
        color: color,
        elevation: elevation ?? 2,
        margin: margin,
        clipBehavior: clipBehavior,
        borderOnForeground: borderOnForeground,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: this,
      );

  Widget cardWithPadding({
    EdgeInsets? padding,
    Color? color,
    double? elevation,
    EdgeInsets? margin,
    BorderRadius? borderRadius,
  }) =>
      Card(
        color: color,
        elevation: elevation ?? 2,
        margin: margin,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: this,
        ),
      );

  // Hero Extension
  Widget hero(String tag) => Hero(tag: tag, child: this);

  // SafeArea Extensions
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) =>
      SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        minimum: minimum,
        maintainBottomViewPadding: maintainBottomViewPadding,
        child: this,
      );

  // Flexible Layout Extensions
  Widget flex(int flex) => Flexible(flex: flex, child: this);
  Widget tight() => Flexible(fit: FlexFit.tight, child: this);
  Widget loose() => Flexible(fit: FlexFit.loose, child: this);

  // Transform Extensions
  Widget rotate(double angle) => Transform.rotate(angle: angle, child: this);
  Widget scale(double scale) => Transform.scale(scale: scale, child: this);
  Widget translate({double x = 0, double y = 0}) => Transform.translate(
        offset: Offset(x, y),
        child: this,
      );

  // Clip Extensions
  Widget clipRect() => ClipRect(child: this);
  Widget clipRRect(BorderRadius borderRadius) => ClipRRect(
        borderRadius: borderRadius,
        child: this,
      );
  Widget clipOval() => ClipOval(child: this);
  Widget clipPath(CustomClipper<Path> clipper) => ClipPath(
        clipper: clipper,
        child: this,
      );

  // Shimmer Effect
  Widget shimmer({
    Color baseColor = const Color(0xFFE0E0E0),
    Color highlightColor = const Color(0xFFF5F5F5),
    Duration period = const Duration(milliseconds: 1500),
  }) =>
      TweenAnimationBuilder<double>(
        tween: Tween(begin: -1.0, end: 2.0),
        duration: period,
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [baseColor, highlightColor, baseColor],
                stops: [
                  (value - 1).clamp(0.0, 1.0),
                  value.clamp(0.0, 1.0),
                  (value + 1).clamp(0.0, 1.0),
                ],
              ),
            ),
            child: this,
          );
        },
      );

  // Tooltip
  Widget tooltip(String message) => Tooltip(
        message: message,
        child: this,
      );

  // Semantics
  Widget semantics({
    String? label,
    String? hint,
    bool? enabled,
    bool? checked,
    bool? selected,
    bool? button,
    bool? header,
    bool? textField,
    bool? readOnly,
    bool? focusable,
    bool? focused,
    bool? inMutuallyExclusiveGroup,
    bool? obscured,
    bool? multiline,
    bool? scopesRoute,
    bool? namesRoute,
    bool? hidden,
    bool? image,
    bool? liveRegion,
    int? maxValueLength,
    int? currentValueLength,
    String? onTapHint,
    String? onLongPressHint,
    String? value,
    String? increasedValue,
    String? decreasedValue,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onScrollLeft,
    VoidCallback? onScrollRight,
    VoidCallback? onScrollUp,
    VoidCallback? onScrollDown,
    VoidCallback? onIncrease,
    VoidCallback? onDecrease,
    VoidCallback? onCopy,
    VoidCallback? onCut,
    VoidCallback? onPaste,
    MoveCursorHandler? onMoveCursorForwardByCharacter,
    MoveCursorHandler? onMoveCursorBackwardByCharacter,
    SetSelectionHandler? onSetSelection,
    VoidCallback? onDidGainAccessibilityFocus,
    VoidCallback? onDidLoseAccessibilityFocus,
    VoidCallback? onDismiss,
  }) =>
      Semantics(
        label: label,
        hint: hint,
        enabled: enabled,
        checked: checked,
        selected: selected,
        button: button,
        header: header,
        textField: textField,
        readOnly: readOnly,
        focusable: focusable,
        focused: focused,
        inMutuallyExclusiveGroup: inMutuallyExclusiveGroup,
        obscured: obscured,
        multiline: multiline,
        scopesRoute: scopesRoute,
        namesRoute: namesRoute,
        hidden: hidden,
        image: image,
        liveRegion: liveRegion,
        maxValueLength: maxValueLength,
        currentValueLength: currentValueLength,
        onTapHint: onTapHint,
        onLongPressHint: onLongPressHint,
        value: value,
        increasedValue: increasedValue,
        decreasedValue: decreasedValue,
        onTap: onTap,
        onLongPress: onLongPress,
        onScrollLeft: onScrollLeft,
        onScrollRight: onScrollRight,
        onScrollUp: onScrollUp,
        onScrollDown: onScrollDown,
        onIncrease: onIncrease,
        onDecrease: onDecrease,
        onCopy: onCopy,
        onCut: onCut,
        onPaste: onPaste,
        onMoveCursorForwardByCharacter: onMoveCursorForwardByCharacter,
        onMoveCursorBackwardByCharacter: onMoveCursorBackwardByCharacter,
        onSetSelection: onSetSelection,
        onDidGainAccessibilityFocus: onDidGainAccessibilityFocus,
        onDidLoseAccessibilityFocus: onDidLoseAccessibilityFocus,
        onDismiss: onDismiss,
        child: this,
      );
}

// Enhanced String Extensions
extension StringExtensions on String {
  // Basic text widget
  Widget text({
    TextStyle? style,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? letterSpacing,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    Paint? background,
    Paint? foreground,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    TextBaseline? textBaseline,
    Locale? locale,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) =>
      Text(
        this,
        style: (style ?? const TextStyle()).copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: height,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          background: background,
          foreground: foreground,
          shadows: shadows,
          fontFeatures: fontFeatures,
          textBaseline: textBaseline,
          locale: locale,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );

  // Display Text Extensions
  Widget displayLarge({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          height: 1.12,
          letterSpacing: -0.25,
        ).merge(style).copyWith(color: color),
      );

  Widget displayMedium({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          height: 1.16,
        ).merge(style).copyWith(color: color),
      );

  Widget displaySmall({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          height: 1.22,
        ).merge(style).copyWith(color: color),
      );

  // Headline Extensions
  Widget headlineLarge({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          height: 1.25,
        ).merge(style).copyWith(color: color),
      );

  Widget headlineMedium({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          height: 1.29,
        ).merge(style).copyWith(color: color),
      );

  Widget headlineSmall({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          height: 1.33,
        ).merge(style).copyWith(color: color),
      );

  // Title Extensions
  Widget titleLarge({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          height: 1.27,
        ).merge(style).copyWith(color: color),
      );

  Widget titleMedium({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.50,
          letterSpacing: 0.15,
        ).merge(style).copyWith(color: color),
      );

  Widget titleSmall({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.43,
          letterSpacing: 0.1,
        ).merge(style).copyWith(color: color),
      );

  // Legacy Header Extensions (for backward compatibility)
  Widget h1({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          height: 1.2,
          letterSpacing: -0.5,
        ).merge(style).copyWith(color: color),
      );

  Widget h2({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          height: 1.3,
          letterSpacing: -0.5,
        ).merge(style).copyWith(color: color),
      );

  Widget h3({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.3,
          letterSpacing: -0.25,
        ).merge(style).copyWith(color: color),
      );

  Widget h4({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.4,
        ).merge(style).copyWith(color: color),
      );

  Widget h5({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          height: 1.4,
        ).merge(style).copyWith(color: color),
      );

  Widget h6({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          letterSpacing: 0.15,
        ).merge(style).copyWith(color: color),
      );

  // Body Text Extensions
  Widget bodyLarge({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
          letterSpacing: 0.5,
        ).merge(style).copyWith(color: color),
      );

  Widget bodyMedium({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 14,
          height: 1.43,
          letterSpacing: 0.25,
        ).merge(style).copyWith(color: color),
      );

  Widget bodySmall({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 12,
          height: 1.33,
          letterSpacing: 0.4,
        ).merge(style).copyWith(color: color),
      );

  // Label Extensions
  Widget labelLarge({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.43,
          letterSpacing: 0.1,
        ).merge(style).copyWith(color: color),
      );

  Widget labelMedium({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1.33,
          letterSpacing: 0.5,
        ).merge(style).copyWith(color: color),
      );

  Widget labelSmall({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 1.45,
          letterSpacing: 0.5,
        ).merge(style).copyWith(color: color),
      );

  // Legacy Text Extensions
  Widget caption({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 12,
          height: 1.33,
          letterSpacing: 0.4,
        ).merge(style).copyWith(color: color?.withOpacity(0.7) ?? color),
      );

  Widget overline({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ).merge(style).copyWith(color: color),
      );

  // Button Extensions
  Widget primaryButton({
    required VoidCallback onPressed,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    double? elevation,
    VoidCallback? onLongPress,
    ButtonStyle? style,
  }) =>
      SizedBox(
        width: width,
        height: height ?? 48,
        child: ElevatedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style ??
              ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? const Color(0xFF2196F3),
                foregroundColor: textColor ?? Colors.white,
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                ),
                elevation: elevation ?? 2,
              ),
          child: Text(this),
        ),
      );

  Widget secondaryButton({
    required VoidCallback onPressed,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? borderColor,
    Color? textColor,
    VoidCallback? onLongPress,
    ButtonStyle? style,
  }) =>
      SizedBox(
        width: width,
        height: height ?? 48,
        child: OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style ??
              OutlinedButton.styleFrom(
                foregroundColor: textColor ?? const Color(0xFF2196F3),
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                ),
                side: BorderSide(color: borderColor ?? const Color(0xFF2196F3)),
              ),
          child: Text(this),
        ),
      );

  Widget textButton({
    required VoidCallback onPressed,
    EdgeInsets? padding,
    Color? textColor,
    VoidCallback? onLongPress,
    ButtonStyle? style,
  }) =>
      TextButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: style ??
            TextButton.styleFrom(
              foregroundColor: textColor ?? const Color(0xFF2196F3),
              padding: padding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
        child: Text(this),
      );

  Widget filledButton({
    required VoidCallback onPressed,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    VoidCallback? onLongPress,
    ButtonStyle? style,
  }) =>
      SizedBox(
        width: width,
        height: height ?? 48,
        child: FilledButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style ??
              FilledButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                ),
              ),
          child: Text(this),
        ),
      );

  Widget tonalButton({
    required VoidCallback onPressed,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? backgroundColor,
    Color? textColor,
    VoidCallback? onLongPress,
    ButtonStyle? style,
  }) =>
      SizedBox(
        width: width,
        height: height ?? 48,
        child: FilledButton.tonal(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style ??
              FilledButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                padding: padding ??
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8),
                ),
              ),
          child: Text(this),
        ),
      );

  // Icon Button Extensions
  Widget iconButton({
    required VoidCallback onPressed,
    required IconData icon,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? iconColor,
    Color? textColor,
    double? iconSize,
    MainAxisSize mainAxisSize = MainAxisSize.min,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    double? spacing,
  }) =>
      InkWell(
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Container(
          padding: padding ?? const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor ?? const Color(0xFF2196F3),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: mainAxisSize,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              Icon(
                icon,
                color: iconColor ?? Colors.white,
                size: iconSize ?? 20,
              ),
              if (isNotEmpty) ...[
                SizedBox(width: spacing ?? 8),
                Text(
                  this,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      );

  Widget floatingActionButton({
    required VoidCallback onPressed,
    IconData? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    ShapeBorder? shape,
    bool mini = false,
    String? heroTag,
    String? tooltip,
  }) =>
      FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        shape: shape,
        heroTag: heroTag,
        tooltip: tooltip,
        icon: icon != null ? Icon(icon) : null,
        label: Text(this),
      );

  // Chip Extensions
  Widget chip({
    Widget? avatar,
    Color? backgroundColor,
    Color? labelColor,
    EdgeInsets? padding,
    VoidCallback? onDeleted,
    VoidCallback? onPressed,
    String? deleteButtonTooltipMessage,
    BorderSide? side,
    OutlinedBorder? shape,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    bool autofocus = false,
    Color? surfaceTintColor,
    double? elevation,
    Color? shadowColor,
    IconThemeData? iconTheme,
  }) =>
      Chip(
        avatar: avatar,
        label: Text(this),
        backgroundColor: backgroundColor,
        padding: padding,
        onDeleted: onDeleted,
        deleteButtonTooltipMessage: deleteButtonTooltipMessage,
        side: side,
        shape: shape,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        shadowColor: shadowColor,
        iconTheme: iconTheme,
        labelStyle: TextStyle(color: labelColor),
      );

  Widget actionChip({
    required VoidCallback onPressed,
    Widget? avatar,
    Color? backgroundColor,
    Color? labelColor,
    EdgeInsets? padding,
    String? tooltip,
    BorderSide? side,
    OutlinedBorder? shape,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    bool autofocus = false,
    Color? surfaceTintColor,
    double? elevation,
    Color? shadowColor,
    IconThemeData? iconTheme,
  }) =>
      ActionChip(
        onPressed: onPressed,
        avatar: avatar,
        label: Text(this),
        backgroundColor: backgroundColor,
        padding: padding,
        tooltip: tooltip,
        side: side,
        shape: shape,
        clipBehavior: clipBehavior,
        focusNode: focusNode,
        autofocus: autofocus,
        surfaceTintColor: surfaceTintColor,
        elevation: elevation,
        shadowColor: shadowColor,
        iconTheme: iconTheme,
        labelStyle: TextStyle(color: labelColor),
      );

  // Badge Extension
  Widget badge({
    Widget? child,
    Color? backgroundColor,
    Color? textColor,
    double? smallSize,
    double? largeSize,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    Offset? offset,
  }) =>
      Badge(
        label: Text(this),
        backgroundColor: backgroundColor,
        textColor: textColor,
        smallSize: smallSize,
        largeSize: largeSize,
        padding: padding,
        alignment: alignment,
        offset: offset,
        child: child,
      );

  // Rich Text Extensions
  Widget richText({
    required List<InlineSpan> children,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    double? textScaleFactor,
    Locale? locale,
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) =>
      RichText(
        text: TextSpan(
          text: this,
          style: style,
          children: children,
        ),
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.clip,
        textScaleFactor: textScaleFactor ?? 1.0,
        locale: locale,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
        textHeightBehavior: textHeightBehavior,
      );

  // SelectableText Extensions
  Widget selectableText({
    TextStyle? style,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    double? letterSpacing,
    double? height,
    FocusNode? focusNode,
    bool showCursor = false,
    bool autofocus = false,
    ToolbarOptions? toolbarOptions,
    SelectionChangedCallback? onSelectionChanged,
    VoidCallback? onTap,
    ScrollPhysics? scrollPhysics,
    TextHeightBehavior? textHeightBehavior,
    TextWidthBasis? textWidthBasis,
    bool enableInteractiveSelection = true,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      SelectableText(
        this,
        style: (style ?? const TextStyle()).copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: height,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        focusNode: focusNode,
        showCursor: showCursor,
        autofocus: autofocus,
        toolbarOptions: toolbarOptions,
        onSelectionChanged: onSelectionChanged,
        onTap: onTap,
        scrollPhysics: scrollPhysics,
        textHeightBehavior: textHeightBehavior,
        textWidthBasis: textWidthBasis,
        enableInteractiveSelection: enableInteractiveSelection,
        dragStartBehavior: dragStartBehavior,
      );
}

// Enhanced Number Extensions
extension NumExtensions on num {
  // Spacing Widgets
  Widget get verticalSpace => SizedBox(height: toDouble());
  Widget get horizontalSpace => SizedBox(width: toDouble());

  // Padding
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());

  // EdgeInsets paddingOnly({
  //   double? left,
  //   double? top,
  //   double? right,
  //   double? bottom,
  // }) =>
  //     EdgeInsets.only(
  //       left: left ?? 0,
  //       top: top ?? 0,
  //       right: right ?? 0,
  //       bottom: bottom ?? 0,
  //     );

  // Margin
  EdgeInsets get marginAll => EdgeInsets.all(toDouble());
  EdgeInsets get marginHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get marginVertical => EdgeInsets.symmetric(vertical: toDouble());

  // EdgeInsets marginOnly({

  //   double? left,
  //   double? top,
  //   double? right,
  //   double? bottom,
  // }) =>
  //     EdgeInsets.only(
  //       left: left ?? 0,
  //       top: top ?? 0,
  //       right: right ?? 0,
  //       bottom: bottom ?? 0,
  //     );

  // Border Radius
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());
  BorderRadius get borderRadiusTop => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get borderRadiusBottom => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );
  BorderRadius get borderRadiusLeft => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        bottomLeft: Radius.circular(toDouble()),
      );
  BorderRadius get borderRadiusRight => BorderRadius.only(
        topRight: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );

  // Radius
  Radius get radius => Radius.circular(toDouble());

  // Duration
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get days => Duration(days: toInt());

  // Size
  Size get size => Size(toDouble(), toDouble());
  Size sizeWith(num other) => Size(toDouble(), other.toDouble());

  // Offset
  Offset get offset => Offset(toDouble(), toDouble());
  Offset offsetWith(num other) => Offset(toDouble(), other.toDouble());

  // Responsive helpers
  double responsive(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (context.isMobile) return mobile;
    if (context.isTablet) return tablet;
    return desktop;
  }

  double responsiveFont(BuildContext context) {
    if (context.isSmallMobile) return toDouble() * 0.9;
    if (context.isMobile) return toDouble();
    if (context.isTablet) return toDouble() * 1.1;
    return toDouble() * 1.2;
  }

  // Animation helpers
  Widget animatedContainer({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    Color? color,
    BoxDecoration? decoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    VoidCallback? onEnd,
  }) =>
      AnimatedContainer(
        duration: duration,
        curve: curve,
        width: toDouble(),
        height: toDouble(),
        color: color,
        decoration: decoration,
        padding: padding,
        margin: margin,
        alignment: alignment,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        onEnd: onEnd,
        child: child,
      );

  // Math utilities
  // double get half => toDouble() / 2;
  // double get quarter => toDouble() / 4;
  // double get double => toDouble() * 2;
  // double get triple => toDouble() * 3;

  // Constraints
  BoxConstraints get constraints => BoxConstraints.tightFor(
        width: toDouble(),
        height: toDouble(),
      );

  BoxConstraints constraintsMin({num? minWidth, num? minHeight}) =>
      BoxConstraints(
        minWidth: minWidth?.toDouble() ?? 0,
        minHeight: minHeight?.toDouble() ?? 0,
        maxWidth: toDouble(),
        maxHeight: toDouble(),
      );

  BoxConstraints constraintsMax({num? maxWidth, num? maxHeight}) =>
      BoxConstraints(
        maxWidth: maxWidth?.toDouble() ?? double.infinity,
        maxHeight: maxHeight?.toDouble() ?? double.infinity,
      );
}
