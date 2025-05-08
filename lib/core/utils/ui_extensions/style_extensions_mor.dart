import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // Neutral Colors
  Color get backgroundColor => const Color(0xFFF5F5F5);
  Color get surfaceColor => Colors.white;
  Color get cardColor => Colors.white;

  // Text Colors
  Color get textPrimary => const Color(0xFF212121);
  Color get textSecondary => const Color(0xFF757575);
  Color get textHint => const Color(0xFFBDBDBD);

  // Status Colors
  Color get successColor => const Color(0xFF4CAF50);
  Color get errorColor => const Color(0xFFF44336);
  Color get warningColor => const Color(0xFFFF9800);
  Color get infoColor => const Color(0xFF2196F3);

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
}

// Text Style Extensions
extension AppTextStyles on BuildContext {
  // Headlines
  TextStyle get h1 => const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        height: 1.2,
      );

  TextStyle get h2 => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.3,
      );

  TextStyle get h3 => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  TextStyle get h4 => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  TextStyle get h5 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );

  TextStyle get h6 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      );

  // Body Text
  TextStyle get bodyLarge => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  TextStyle get bodyMedium => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  TextStyle get bodySmall => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.4,
      );

  // Special Text Styles
  TextStyle get caption => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.3,
      );

  TextStyle get button => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      );

  TextStyle get overline => const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      );
}

// Sizing Extensions
extension AppSizing on BuildContext {
  // Screen Dimensions
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Responsive Breakpoints
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;

  // Spacing
  double get xs => 4.0;
  double get sm => 8.0;
  double get md => 16.0;
  double get lg => 24.0;
  double get xl => 32.0;
  double get xxl => 48.0;

  // Padding
  EdgeInsets get paddingXS => EdgeInsets.all(xs);
  EdgeInsets get paddingSM => EdgeInsets.all(sm);
  EdgeInsets get paddingMD => EdgeInsets.all(md);
  EdgeInsets get paddingLG => EdgeInsets.all(lg);
  EdgeInsets get paddingXL => EdgeInsets.all(xl);

  // Horizontal Padding
  EdgeInsets get paddingHorizontalXS => EdgeInsets.symmetric(horizontal: xs);
  EdgeInsets get paddingHorizontalSM => EdgeInsets.symmetric(horizontal: sm);
  EdgeInsets get paddingHorizontalMD => EdgeInsets.symmetric(horizontal: md);
  EdgeInsets get paddingHorizontalLG => EdgeInsets.symmetric(horizontal: lg);

  // Vertical Padding
  EdgeInsets get paddingVerticalXS => EdgeInsets.symmetric(vertical: xs);
  EdgeInsets get paddingVerticalSM => EdgeInsets.symmetric(vertical: sm);
  EdgeInsets get paddingVerticalMD => EdgeInsets.symmetric(vertical: md);
  EdgeInsets get paddingVerticalLG => EdgeInsets.symmetric(vertical: lg);

  // Border Radius
  BorderRadius get radiusXS => BorderRadius.circular(xs);
  BorderRadius get radiusSM => BorderRadius.circular(sm);
  BorderRadius get radiusMD => BorderRadius.circular(md);
  BorderRadius get radiusLG => BorderRadius.circular(lg);
  BorderRadius get radiusXL => BorderRadius.circular(xl);

  // Icon Sizes
  double get iconXS => 16.0;
  double get iconSM => 20.0;
  double get iconMD => 24.0;
  double get iconLG => 32.0;
  double get iconXL => 48.0;
}

// Box Decoration Extensions
extension AppDecorations on BuildContext {
  // Card Decorations
  BoxDecoration get cardDecoration => BoxDecoration(
        color: surfaceColor,
        borderRadius: radiusMD,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
            color: Colors.black.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, 4),
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
        border: Border.all(color: primaryColor),
        borderRadius: radiusSM,
        color: Colors.transparent,
      );

  // Input Decorations
  InputDecoration get inputDecoration => InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        border: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radiusSM,
          borderSide: BorderSide(color: errorColor, width: 1),
        ),
        contentPadding: paddingMD,
      );
}

// Widget Extensions
extension WidgetExtensions on Widget {
  // Padding Extensions
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

  // Margin Extensions (using Container)
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

  // Decoration Extensions
  Widget decorated(BoxDecoration decoration) => Container(
        decoration: decoration,
        child: this,
      );

  // Sizing Extensions
  Widget sized({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
        child: this,
      );

  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);

  Widget flexible([int flex = 1]) => Flexible(flex: flex, child: this);

  // Alignment Extensions
  Widget centered() => Center(child: this);

  Widget aligned(Alignment alignment) => Align(
        alignment: alignment,
        child: this,
      );

  // Gesture Extensions with InkWell
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

  // Button Extensions with InkWell
  Widget button({
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    BoxDecoration? decoration,
  }) =>
      InkWell(
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: decoration ??
              BoxDecoration(
                color: backgroundColor ?? Colors.blue,
                borderRadius: borderRadius ?? BorderRadius.circular(8),
              ),
          child: this,
        ),
      );
}

// String Extensions for Text Styling
extension StringExtensions on String {
  Widget text({
    TextStyle? style,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: (style ?? const TextStyle()).copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  // Updated methods with proper style merging
  Widget h1({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
            .merge(style)
            .copyWith(color: color),
      );

  Widget h2({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
            .merge(style)
            .copyWith(color: color),
      );

  Widget h3({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)
            .merge(style)
            .copyWith(color: color),
      );

  Widget h4({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
            .merge(style)
            .copyWith(color: color),
      );

  Widget h5({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
            .merge(style)
            .copyWith(color: color),
      );

  Widget h6({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
            .merge(style)
            .copyWith(color: color),
      );

  Widget bodyLarge({Color? color, TextStyle? style}) => Text(
        this,
        style:
            const TextStyle(fontSize: 16).merge(style).copyWith(color: color),
      );

  Widget bodyMedium({Color? color, TextStyle? style}) => Text(
        this,
        style:
            const TextStyle(fontSize: 14).merge(style).copyWith(color: color),
      );

  Widget bodySmall({Color? color, TextStyle? style}) => Text(
        this,
        style:
            const TextStyle(fontSize: 12).merge(style).copyWith(color: color),
      );

  Widget caption({Color? color, TextStyle? style}) => Text(
        this,
        style: const TextStyle(fontSize: 12)
            .merge(style)
            .copyWith(color: color?.withOpacity(0.7) ?? color),
      );

  // Button Text Extensions with InkWell
  Widget button({
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
  }) =>
      InkWell(
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.blue,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
          child: Text(
            this,
            style: (textStyle ??
                    const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ))
                .copyWith(color: textColor ?? Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );

  // Quick Button Styles
  Widget primaryButton({
    required VoidCallback onPressed,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
  }) =>
      button(
        onPressed: onPressed,
        backgroundColor: const Color(0xFF2196F3),
        textColor: Colors.white,
        padding: padding,
        borderRadius: borderRadius,
      );

  Widget secondaryButton({
    required VoidCallback onPressed,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
  }) =>
      InkWell(
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Container(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF2196F3)),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
          child: Text(
            this,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: Color(0xFF2196F3),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
}

// Number Extensions
extension NumExtensions on num {
  Widget get verticalSpace => SizedBox(height: toDouble());
  Widget get horizontalSpace => SizedBox(width: toDouble());

  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());

  BorderRadius get borderRadius => BorderRadius.circular(toDouble());

  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
}

///تحويل أي نص مباشرة للـ Gradient:
extension GradientTextExtension on String {
  Widget gradientText({
    required BuildContext context,
    required Gradient gradient,
    TextStyle? style,
  }) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        this,
        style: (style ?? const TextStyle()).copyWith(color: Colors.white),
      ),
    );
  }
}

//تحويل أي Widget لكأنها Button بدون كتابة InkWell كل مرة:
extension ClickableWidget on Widget {
  Widget onClick(VoidCallback onTap, {BorderRadius? borderRadius}) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: this,
    );
  }
}

//سهل جدًا لتفعيل/إخفاء أي Widget حسب شرط:
extension ConditionalVisibility on Widget {
  Widget visible(bool isVisible) {
    return isVisible ? this : const SizedBox.shrink();
  }
}

//تقدر تحول أي List لـ ListView بسرعة:
extension ListViewExtensions<T> on List<T> {
  Widget toListView({
    required Widget Function(BuildContext, T) itemBuilder,
    bool shrinkWrap = false,
    ScrollPhysics? physics,
  }) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: length,
      itemBuilder: (context, index) => itemBuilder(context, this[index]),
    );
  }
}

///
// التحويل بين صيغ مختلفة (yyyy-MM-dd, dd/MM/yyyy, إلخ)

// عرض الوقت منذ الآن (time ago) بدقة ودعم الثواني، الدقائق، الساعات، الأيام، الأشهر، السنوات

// إضافة/طرح أيام، ساعات، دقائق بسهولة

// التنسيق الذكي حسب الوقت الحالي (اليوم، أمس، قبل أسبوع، قبل شهر)

// تحويل للـ UTC أو Local

extension DateTimeUtils on DateTime {
  /// Convert to formatted string
  String format({String pattern = "yyyy-MM-dd HH:mm", bool utc = false}) {
    final dt = utc ? toUtc() : toLocal();
    return DateFormat(pattern).format(dt);
  }

  /// Time ago from now
  String timeAgo({bool short = false}) {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 60) return short ? "now" : "Just now";
    if (diff.inMinutes < 60)
      return short ? "${diff.inMinutes}m" : "${diff.inMinutes} minutes ago";
    if (diff.inHours < 24)
      return short ? "${diff.inHours}h" : "${diff.inHours} hours ago";
    if (diff.inDays == 1) return short ? "1d" : "Yesterday";
    if (diff.inDays < 7)
      return short ? "${diff.inDays}d" : "${diff.inDays} days ago";
    if (diff.inDays < 30)
      return short
          ? "${(diff.inDays / 7).floor()}w"
          : "${(diff.inDays / 7).floor()} week(s) ago";
    if (diff.inDays < 365)
      return short
          ? "${(diff.inDays / 30).floor()}mo"
          : "${(diff.inDays / 30).floor()} month(s) ago";
    return short
        ? "${(diff.inDays / 365).floor()}y"
        : "${(diff.inDays / 365).floor()} year(s) ago";
  }

  /// Add days, hours, minutes
  DateTime addDays(int days) => add(Duration(days: days));
  DateTime addHours(int hours) => add(Duration(hours: hours));
  DateTime addMinutes(int minutes) => add(Duration(minutes: minutes));

  /// Subtract days, hours, minutes
  DateTime subtractDays(int days) => subtract(Duration(days: days));
  DateTime subtractHours(int hours) => subtract(Duration(hours: hours));
  DateTime subtractMinutes(int minutes) => subtract(Duration(minutes: minutes));

  /// Start of day
  DateTime get startOfDay => DateTime(year, month, day);

  /// End of day
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  /// Check if today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if same day
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  /// Convert to UTC
  DateTime get toUtcTime => toUtc();

  /// Convert to Local
  DateTime get toLocalTime => toLocal();
}

/// =======================
/// 📋 Pagination Extensions
/// =======================

/// 🔹 List Extensions for Pagination
extension PaginationList<T> on List<T> {
  /// إضافة صفحة جديدة للبيانات
  List<T> appendPage(List<T> newPage, {bool allowDuplicates = false}) {
    if (allowDuplicates) return [...this, ...newPage];
    final existing = Set.from(this);
    final merged = [...this];
    for (var item in newPage) {
      if (!existing.contains(item)) {
        merged.add(item);
      }
    }
    return merged;
  }

  /// جلب صفحة من الليست (مفيد مع local data أو mock)
  List<T> getPage(int page, int pageSize) {
    final start = (page - 1) * pageSize;
    if (start >= length) return [];
    final end = (start + pageSize).clamp(0, length);
    return sublist(start, end);
  }

  /// هل وصلنا للنهاية (على حسب حجم الصفحة)
  bool reachedEnd(int pageSize) => length % pageSize != 0;
}

/// =======================
/// 📋 Pagination Result Model
/// =======================
class PageResult<T> {
  final List<T> items;
  final bool hasMore;
  final int currentPage;

  PageResult({
    required this.items,
    required this.hasMore,
    required this.currentPage,
  });
}

/// 🔹 تحويل أي List لصفحة جاهزة
extension PaginationResult<T> on List<T> {
  PageResult<T> toPageResult({
    required int page,
    required int pageSize,
  }) {
    final items = getPage(page, pageSize);
    return PageResult<T>(
      items: items,
      hasMore: items.length == pageSize,
      currentPage: page,
    );
  }
}
