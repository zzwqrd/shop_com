// import 'package:flutter/material.dart';

// // =============================================================================
// // نظام الألوان (Color System)
// // =============================================================================
// extension AppColorsExtension on BuildContext {
//   // الألوان الأساسية
//   Color get primaryColor => const Color(0xFF2196F3);
//   Color get primaryDark => const Color(0xFF1976D2);
//   Color get primaryLight => const Color(0xFFBBDEFB);

//   Color get secondaryColor => const Color(0xFFFF9800);
//   Color get secondaryDark => const Color(0xFFF57C00);
//   Color get secondaryLight => const Color(0xFFFFE0B2);

//   Color get accentColor => const Color(0xFF9C27B0);

//   // ألوان الخلفيات
//   Color get backgroundColor => const Color(0xFFFAFAFA);
//   Color get surfaceColor => Colors.white;
//   Color get cardColor => Colors.white;

//   // ألوان النصوص
//   Color get textPrimary => const Color(0xFF212121);
//   Color get textSecondary => const Color(0xFF757575);
//   Color get textHint => const Color(0xFF9E9E9E);
//   Color get textDisabled => const Color(0xFFBDBDBD);
//   Color get textOnPrimary => Colors.white;

//   // ألوان الحالة
//   Color get successColor => const Color(0xFF4CAF50);
//   Color get errorColor => const Color(0xFFF44336);
//   Color get warningColor => const Color(0xFFFF9800);
//   Color get infoColor => const Color(0xFF2196F3);

//   // ألوان الحدود والفواصل
//   Color get borderColor => const Color(0xFFE0E0E0);
//   Color get dividerColor => const Color(0xFFEEEEEE);

//   // تدرجات جاهزة
//   LinearGradient get primaryGradient => LinearGradient(
//         colors: [primaryColor, primaryDark],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       );

//   LinearGradient get secondaryGradient => LinearGradient(
//         colors: [secondaryColor, secondaryDark],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       );

//   LinearGradient get successGradient => LinearGradient(
//         colors: [successColor, const Color(0xFF388E3C)],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       );
// }

// // =============================================================================
// // نظام الأحجام (Sizing System)
// // =============================================================================
// extension AppSizingExtension on BuildContext {
//   // المسافات الأساسية
//   double get xs => 4.0;
//   double get sm => 8.0;
//   double get md => 16.0;
//   double get lg => 24.0;
//   double get xl => 32.0;
//   double get xxl => 48.0;

//   // أحجام الأيقونات
//   double get iconXS => 16.0;
//   double get iconSM => 20.0;
//   double get iconMD => 24.0;
//   double get iconLG => 32.0;
//   double get iconXL => 48.0;

//   // نصف أقطار الحدود
//   BorderRadius get radiusXS => BorderRadius.circular(4.0);
//   BorderRadius get radiusSM => BorderRadius.circular(8.0);
//   BorderRadius get radiusMD => BorderRadius.circular(12.0);
//   BorderRadius get radiusLG => BorderRadius.circular(16.0);
//   BorderRadius get radiusXL => BorderRadius.circular(24.0);
//   BorderRadius get radiusCircular => BorderRadius.circular(999);

//   // أحجام الخط
//   double get textXS => 10.0;
//   double get textSM => 12.0;
//   double get textBase => 14.0;
//   double get textLG => 16.0;
//   double get textXL => 18.0;
//   double get text2XL => 20.0;
//   double get text3XL => 24.0;
//   double get text4XL => 32.0;
//   double get text5XL => 48.0;

//   // الحشو والهوامش
//   EdgeInsets get paddingXS => EdgeInsets.all(xs);
//   EdgeInsets get paddingSM => EdgeInsets.all(sm);
//   EdgeInsets get paddingMD => EdgeInsets.all(md);
//   EdgeInsets get paddingLG => EdgeInsets.all(lg);
//   EdgeInsets get paddingXL => EdgeInsets.all(xl);

//   EdgeInsets get paddingHorizontalXS => EdgeInsets.symmetric(horizontal: xs);
//   EdgeInsets get paddingHorizontalSM => EdgeInsets.symmetric(horizontal: sm);
//   EdgeInsets get paddingHorizontalMD => EdgeInsets.symmetric(horizontal: md);
//   EdgeInsets get paddingHorizontalLG => EdgeInsets.symmetric(horizontal: lg);

//   EdgeInsets get paddingVerticalXS => EdgeInsets.symmetric(vertical: xs);
//   EdgeInsets get paddingVerticalSM => EdgeInsets.symmetric(vertical: sm);
//   EdgeInsets get paddingVerticalMD => EdgeInsets.symmetric(vertical: md);
//   EdgeInsets get paddingVerticalLG => EdgeInsets.symmetric(vertical: lg);

//   // التصميم المتجاوب
//   double get screenWidth => MediaQuery.of(this).size.width;
//   double get screenHeight => MediaQuery.of(this).size.height;

//   bool get isMobile => screenWidth < 768;
//   bool get isTablet => screenWidth >= 768 && screenWidth < 1024;
//   bool get isDesktop => screenWidth >= 1024;

//   // أحجام متجاوبة
//   double responsiveWidth(double percentage) => screenWidth * percentage;
//   double responsiveHeight(double percentage) => screenHeight * percentage;
// }

// // =============================================================================
// // أنماط النصوص (Text Styles)
// // =============================================================================
// extension AppTextStylesExtension on BuildContext {
//   TextStyle get h1 => TextStyle(
//         fontSize: text4XL,
//         fontWeight: FontWeight.bold,
//         color: textPrimary,
//         height: 1.2,
//       );

//   TextStyle get h2 => TextStyle(
//         fontSize: text3XL,
//         fontWeight: FontWeight.bold,
//         color: textPrimary,
//         height: 1.3,
//       );

//   TextStyle get h3 => TextStyle(
//         fontSize: text2XL,
//         fontWeight: FontWeight.w600,
//         color: textPrimary,
//         height: 1.4,
//       );

//   TextStyle get h4 => TextStyle(
//         fontSize: textXL,
//         fontWeight: FontWeight.w600,
//         color: textPrimary,
//         height: 1.4,
//       );

//   TextStyle get h5 => TextStyle(
//         fontSize: textLG,
//         fontWeight: FontWeight.w500,
//         color: textPrimary,
//         height: 1.5,
//       );

//   TextStyle get h6 => TextStyle(
//         fontSize: textBase,
//         fontWeight: FontWeight.w500,
//         color: textPrimary,
//         height: 1.5,
//       );

//   TextStyle get bodyLarge => TextStyle(
//         fontSize: textLG,
//         fontWeight: FontWeight.normal,
//         color: textPrimary,
//         height: 1.6,
//       );

//   TextStyle get bodyMedium => TextStyle(
//         fontSize: textBase,
//         fontWeight: FontWeight.normal,
//         color: textPrimary,
//         height: 1.6,
//       );

//   TextStyle get bodySmall => TextStyle(
//         fontSize: textSM,
//         fontWeight: FontWeight.normal,
//         color: textSecondary,
//         height: 1.5,
//       );

//   TextStyle get caption => TextStyle(
//         fontSize: textXS,
//         fontWeight: FontWeight.normal,
//         color: textHint,
//         height: 1.4,
//       );

//   TextStyle get button => TextStyle(
//         fontSize: textBase,
//         fontWeight: FontWeight.w600,
//         color: textPrimary,
//         height: 1.2,
//       );

//   TextStyle get label => TextStyle(
//         fontSize: textSM,
//         fontWeight: FontWeight.w500,
//         color: textSecondary,
//         height: 1.3,
//       );
// }

// // =============================================================================
// // تزيين الصناديق (Box Decorations)
// // =============================================================================
// extension AppDecorationsExtension on BuildContext {
//   // تصاميم البطاقات
//   BoxDecoration get cardDecoration => BoxDecoration(
//         color: cardColor,
//         borderRadius: radiusSM,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       );

//   BoxDecoration get elevatedCardDecoration => BoxDecoration(
//         color: cardColor,
//         borderRadius: radiusMD,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 16,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       );

//   // تصاميم الأزرار
//   BoxDecoration get primaryButtonDecoration => BoxDecoration(
//         gradient: primaryGradient,
//         borderRadius: radiusSM,
//         boxShadow: [
//           BoxShadow(
//             color: primaryColor.withOpacity(0.3),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       );

//   BoxDecoration get secondaryButtonDecoration => BoxDecoration(
//         color: Colors.transparent,
//         border: Border.all(color: primaryColor, width: 2),
//         borderRadius: radiusSM,
//       );

//   BoxDecoration get ghostButtonDecoration => BoxDecoration(
//         color: primaryColor.withOpacity(0.1),
//         borderRadius: radiusSM,
//       );

//   // تصاميم حقول الإدخال
//   InputDecoration get inputDecoration => InputDecoration(
//         filled: true,
//         fillColor: backgroundColor,
//         border: OutlineInputBorder(
//           borderRadius: radiusSM,
//           borderSide: BorderSide(color: borderColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: radiusSM,
//           borderSide: BorderSide(color: borderColor),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: radiusSM,
//           borderSide: BorderSide(color: primaryColor, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: radiusSM,
//           borderSide: BorderSide(color: errorColor),
//         ),
//         contentPadding: paddingMD,
//       );

//   // تصاميم الحالة
//   BoxDecoration successDecoration({double? radius}) => BoxDecoration(
//         color: successColor,
//         borderRadius: BorderRadius.circular(radius ?? sm),
//       );

//   BoxDecoration errorDecoration({double? radius}) => BoxDecoration(
//         color: errorColor,
//         borderRadius: BorderRadius.circular(radius ?? sm),
//       );

//   BoxDecoration warningDecoration({double? radius}) => BoxDecoration(
//         color: warningColor,
//         borderRadius: BorderRadius.circular(radius ?? sm),
//       );

//   BoxDecoration infoDecoration({double? radius}) => BoxDecoration(
//         color: infoColor,
//         borderRadius: BorderRadius.circular(radius ?? sm),
//       );
// }

// // =============================================================================
// // إكستنشنز النصوص (String Extensions)
// // =============================================================================
// extension StringTextExtensions on String {
//   Text h1({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 32,
//           fontWeight: FontWeight.bold,
//           color: color,
//           height: 1.2,
//         ),
//         textAlign: textAlign,
//       );

//   Text h2({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//           color: color,
//           height: 1.3,
//         ),
//         textAlign: textAlign,
//       );

//   Text h3({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: color,
//           height: 1.4,
//         ),
//         textAlign: textAlign,
//       );

//   Text h4({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//           color: color,
//           height: 1.4,
//         ),
//         textAlign: textAlign,
//       );

//   Text h5({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: color,
//           height: 1.5,
//         ),
//         textAlign: textAlign,
//       );

//   Text h6({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: color,
//           height: 1.5,
//         ),
//         textAlign: textAlign,
//       );

//   Text bodyLarge({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.normal,
//           color: color,
//           height: 1.6,
//         ),
//         textAlign: textAlign,
//       );

//   Text bodyMedium({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.normal,
//           color: color,
//           height: 1.6,
//         ),
//         textAlign: textAlign,
//       );

//   Text bodySmall({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.normal,
//           color: color,
//           height: 1.5,
//         ),
//         textAlign: textAlign,
//       );

//   Text caption({Color? color, TextAlign? textAlign}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.normal,
//           color: color,
//           height: 1.4,
//         ),
//         textAlign: textAlign,
//       );

//   Text get button => Text(
//         this,
//         style: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//           height: 1.2,
//         ),
//       );

//   Text label({Color? color}) => Text(
//         this,
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w500,
//           color: color,
//           height: 1.3,
//         ),
//       );
// }

// // =============================================================================
// // إكستنشنز الأرقام للمسافات (Number Extensions)
// // =============================================================================
// extension SpacingExtensions on num {
//   Widget get verticalSpace => SizedBox(height: toDouble());
//   Widget get horizontalSpace => SizedBox(width: toDouble());

//   EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
//   EdgeInsets get paddingHorizontal =>
//       EdgeInsets.symmetric(horizontal: toDouble());
//   EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());
//   EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());
//   EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());
//   EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());
//   EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());

//   BorderRadius get radius => BorderRadius.circular(toDouble());
//   BorderRadius get radiusTop =>
//       BorderRadius.vertical(top: Radius.circular(toDouble()));
//   BorderRadius get radiusBottom =>
//       BorderRadius.vertical(bottom: Radius.circular(toDouble()));
//   BorderRadius get radiusLeft =>
//       BorderRadius.horizontal(left: Radius.circular(toDouble()));
//   BorderRadius get radiusRight =>
//       BorderRadius.horizontal(right: Radius.circular(toDouble()));
// }

// // =============================================================================
// // إكستنشنز الويدجت (Widget Extensions)
// // =============================================================================
// extension WidgetExtensions on Widget {
//   // الحشو والهوامش
//   Widget paddingAll(double value) => Padding(
//         padding: EdgeInsets.all(value),
//         child: this,
//       );

//   Widget paddingSymmetric({double? horizontal, double? vertical}) => Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: horizontal ?? 0,
//           vertical: vertical ?? 0,
//         ),
//         child: this,
//       );

//   Widget paddingOnly({
//     double? left,
//     double? top,
//     double? right,
//     double? bottom,
//   }) =>
//       Padding(
//         padding: EdgeInsets.only(
//           left: left ?? 0,
//           top: top ?? 0,
//           right: right ?? 0,
//           bottom: bottom ?? 0,
//         ),
//         child: this,
//       );

//   Widget padding(EdgeInsets padding) => Padding(
//         padding: padding,
//         child: this,
//       );

//   Widget marginAll(double value) => Container(
//         margin: EdgeInsets.all(value),
//         child: this,
//       );

//   Widget marginSymmetric({double? horizontal, double? vertical}) => Container(
//         margin: EdgeInsets.symmetric(
//           horizontal: horizontal ?? 0,
//           vertical: vertical ?? 0,
//         ),
//         child: this,
//       );

//   Widget marginOnly({
//     double? left,
//     double? top,
//     double? right,
//     double? bottom,
//   }) =>
//       Container(
//         margin: EdgeInsets.only(
//           left: left ?? 0,
//           top: top ?? 0,
//           right: right ?? 0,
//           bottom: bottom ?? 0,
//         ),
//         child: this,
//       );

//   // الحجم
//   Widget size(double width, double height) => SizedBox(
//         width: width,
//         height: height,
//         child: this,
//       );

//   Widget width(double width) => SizedBox(
//         width: width,
//         child: this,
//       );

//   Widget height(double height) => SizedBox(
//         height: height,
//         child: this,
//       );

//   Widget expanded([int flex = 1]) => Expanded(
//         flex: flex,
//         child: this,
//       );

//   Widget flexible([int flex = 1]) => Flexible(
//         flex: flex,
//         child: this,
//       );

//   // التزيين
//   Widget decorated(BoxDecoration decoration) => Container(
//         decoration: decoration,
//         child: this,
//       );

//   Widget backgroundColor(Color color) => Container(
//         color: color,
//         child: this,
//       );

//   Widget cornerRadius(double radius) => Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(radius),
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: this,
//       );

//   Widget border({
//     Color? color,
//     double? width,
//     double? radius,
//   }) =>
//       Container(
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: color ?? Colors.grey,
//             width: width ?? 1,
//           ),
//           borderRadius: radius != null ? BorderRadius.circular(radius) : null,
//         ),
//         child: this,
//       );

//   Widget shadow({
//     Color? color,
//     double? blurRadius,
//     Offset? offset,
//   }) =>
//       Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: color ?? Colors.black.withOpacity(0.1),
//               blurRadius: blurRadius ?? 8,
//               offset: offset ?? const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: this,
//       );

//   // الإيماءات
//   Widget onTap(VoidCallback? onTap) => GestureDetector(
//         onTap: onTap,
//         child: this,
//       );

//   Widget onDoubleTap(VoidCallback? onDoubleTap) => GestureDetector(
//         onDoubleTap: onDoubleTap,
//         child: this,
//       );

//   Widget onLongPress(VoidCallback? onLongPress) => GestureDetector(
//         onLongPress: onLongPress,
//         child: this,
//       );

//   Widget inkWell({
//     VoidCallback? onTap,
//     BorderRadius? borderRadius,
//   }) =>
//       InkWell(
//         onTap: onTap,
//         borderRadius: borderRadius,
//         child: this,
//       );

//   // المحاذاة
//   Widget center() => Center(child: this);

//   Widget align(Alignment alignment) => Align(
//         alignment: alignment,
//         child: this,
//       );

//   Widget positioned({
//     double? left,
//     double? top,
//     double? right,
//     double? bottom,
//   }) =>
//       Positioned(
//         left: left,
//         top: top,
//         right: right,
//         bottom: bottom,
//         child: this,
//       );

//   // الرؤية والحالة
//   Widget visible(bool isVisible) => Visibility(
//         visible: isVisible,
//         child: this,
//       );

//   Widget opacity(double opacity) => Opacity(
//         opacity: opacity,
//         child: this,
//       );

//   Widget fade({Duration? duration}) => AnimatedOpacity(
//         opacity: 1.0,
//         duration: duration ?? const Duration(milliseconds: 300),
//         child: this,
//       );

//   // التدوير والتحويل
//   Widget rotate(double angle) => Transform.rotate(
//         angle: angle,
//         child: this,
//       );

//   Widget scale(double scale) => Transform.scale(
//         scale: scale,
//         child: this,
//       );

//   Widget translate({double? x, double? y}) => Transform.translate(
//         offset: Offset(x ?? 0, y ?? 0),
//         child: this,
//       );

//   // الحاويات الخاصة
//   Widget card({
//     Color? color,
//     double? elevation,
//     BorderRadius? borderRadius,
//     EdgeInsets? padding,
//   }) =>
//       Card(
//         color: color,
//         elevation: elevation,
//         shape: borderRadius != null
//             ? RoundedRectangleBorder(borderRadius: borderRadius)
//             : null,
//         child: padding != null ? this.padding(padding) : this,
//       );

//   Widget hero(String tag) => Hero(
//         tag: tag,
//         child: this,
//       );

//   Widget safeArea() => SafeArea(child: this);

//   Widget scrollable({ScrollPhysics? physics}) => SingleChildScrollView(
//         physics: physics,
//         child: this,
//       );
// }

// // =============================================================================
// // إكستنشنز النص (Text Extensions)
// // =============================================================================
// extension TextExtensions on Text {
//   Text color(Color color) => Text(
//         data ?? '',
//         style: (style ?? const TextStyle()).copyWith(color: color),
//         textAlign: textAlign,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text fontSize(double size) => Text(
//         data ?? '',
//         style: (style ?? const TextStyle()).copyWith(fontSize: size),
//         textAlign: textAlign,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text fontWeight(FontWeight weight) => Text(
//         data ?? '',
//         style: (style ?? const TextStyle()).copyWith(fontWeight: weight),
//         textAlign: textAlign,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text bold() => fontWeight(FontWeight.bold);
//   Text semiBold() => fontWeight(FontWeight.w600);
//   Text medium() => fontWeight(FontWeight.w500);
//   Text regular() => fontWeight(FontWeight.normal);
//   Text light() => fontWeight(FontWeight.w300);

//   Text italic() => Text(
//         data ?? '',
//         style:
//             (style ?? const TextStyle()).copyWith(fontStyle: FontStyle.italic),
//         textAlign: textAlign,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text underline() => Text(
//         data ?? '',
//         style: (style ?? const TextStyle())
//             .copyWith(decoration: TextDecoration.underline),
//         textAlign: textAlign,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text strikeThrough() => Text(
//         data ?? '',
//         style: (style ?? const TextStyle())
//             .copyWith(decoration: TextDecoration.lineThrough),
//         textAlign: textAlign,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text textAlign(TextAlign align) => Text(
//         data ?? '',
//         style: style,
//         textAlign: align,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text maxLines(int lines) => Text(
//         data ?? '',
//         style: style,
//         textAlign: textAlign,
//         overflow: overflow ?? TextOverflow.ellipsis,
//         maxLines: lines,
//       );

//   Text overflow(TextOverflow overflow) => Text(
//         data ?? '',
//         style: style,
//         textAlign: textAlign,
//         overflow: overflow,
//         maxLines: maxLines,
//       );

//   Text ellipsis() => overflow(TextOverflow.ellipsis);
//   Text fade() => overflow(TextOverflow.fade);
//   Text clip() => overflow(TextOverflow.clip);
// }
