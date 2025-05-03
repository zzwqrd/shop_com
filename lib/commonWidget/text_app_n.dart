import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final int? maxLines;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final double? textScaleFactor;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final bool? isSelectable;
  final FocusNode? focusNode;
  final bool? autofocus;

  // Icon & Image Properties
  final IconData? icon;
  final Widget? customIcon;
  final ImageProvider? image;
  final Color? iconColor;
  final double? iconSize;
  final double? imageSize;
  final EdgeInsets? iconPadding;
  final MainAxisAlignment? iconAlignment;

  // Interactive Properties
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final MouseCursor? mouseCursor;
  final bool? showUnderlineOnHover;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? highlightColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? borderRadius;

  // Animation Properties
  final Duration? animationDuration;
  final Curve? animationCurve;
  final bool? animateOnHover;
  final double? hoverScale;

  // Shadow Properties
  final List<Shadow>? shadows;
  final Color? shadowColor;
  final double? shadowBlurRadius;
  final Offset? shadowOffset;

  // Layout Properties
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final AlignmentGeometry? alignment;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final Clip? clipBehavior;

  const AppText({
    super.key,
    required this.text,
    this.align,
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textScaleFactor,
    this.semanticsLabel,
    this.textWidthBasis,
    this.isSelectable = false,
    this.focusNode,
    this.autofocus = false,
    this.icon,
    this.customIcon,
    this.image,
    this.iconColor,
    this.iconSize,
    this.imageSize,
    this.iconPadding,
    this.iconAlignment,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.mouseCursor,
    this.showUnderlineOnHover = false,
    this.hoverColor,
    this.splashColor,
    this.highlightColor,
    this.overlayColor,
    this.borderRadius,
    this.animationDuration,
    this.animationCurve,
    this.animateOnHover = false,
    this.hoverScale = 1.05,
    this.shadows,
    this.shadowColor,
    this.shadowBlurRadius,
    this.shadowOffset,
    this.padding,
    this.margin,
    this.alignment,
    this.width,
    this.height,
    this.constraints,
    this.decoration,
    this.clipBehavior,
  });
  // Shortcut constructor for simple text
  AppText.simple(
    String text, {
    Key? key,
    double fontSize = 14,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) : this(
          key: key,
          text: text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        );

  // Heading variants
  factory AppText.headingLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? align = TextAlign.start,
    int? maxLines,
  }) {
    return AppText(
      key: key,
      text: text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        letterSpacing: 0.5,
      ),
    );
  }

  factory AppText.headingMedium(
    String text, {
    Key? key,
    Color? color,
    TextAlign? align = TextAlign.start,
    int? maxLines,
  }) {
    return AppText(
      key: key,
      text: text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        letterSpacing: 0.25,
      ),
    );
  }

  // Body text variants
  factory AppText.bodyLarge(
    String text, {
    Key? key,
    Color? color,
    TextAlign? align = TextAlign.start,
    int? maxLines,
  }) {
    return AppText(
      key: key,
      text: text,
      align: align,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        letterSpacing: 0.15,
        height: 1.5,
      ),
    );
  }

  factory AppText.bodyMedium({
    Key? key,
    required String text,
    Color? color,
    TextAlign? align = TextAlign.start,
    int? maxLines,
    bool? softWrap = true,
    TextOverflow? overflow,
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = 14.0,
    double? letterSpacing = 0.25,
    double? height = 1.5,
    bool? isSelectable = false,
  }) {
    return AppText(
      key: key,
      text: text,
      align: align,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height,
      ),
      isSelectable: isSelectable,
    );
  }
  factory AppText.bodySmall({
    Key? key,
    required String text,
    Color? color,
    TextAlign? align = TextAlign.start,
    int? maxLines,
    bool? softWrap = true,
    TextOverflow? overflow,
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = 12.0,
    double? letterSpacing = 0.4,
    double? height = 1.5,
  }) {
    return AppText(
      key: key,
      text: text,
      align: align,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }
  // Caption text variant
  factory AppText.caption({
    Key? key,
    required String text,
    Color? color,
    TextAlign? align = TextAlign.start,
    int? maxLines,
    bool? softWrap = true,
    TextOverflow? overflow,
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = 12.0,
    double? letterSpacing = 0.4,
    double? height = 1.5,
  }) {
    return AppText(
      key: key,
      text: text,
      align: align,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }

  factory AppText.clickable({
    Key? key,
    required String text,
    required VoidCallback onTap,
    Color? color = Colors.blue,
    TextAlign? align = TextAlign.start,
    TextDecoration? decoration = TextDecoration.underline,
    FontWeight? fontWeight = FontWeight.w500,
    double? fontSize = 16.0,
    bool? showUnderlineOnHover = true,
    Color? hoverColor = Colors.blueAccent,
    Duration? animationDuration = const Duration(milliseconds: 200),
  }) {
    return AppText(
      key: key,
      text: text,
      align: align,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
      ),
      onTap: onTap,
      showUnderlineOnHover: showUnderlineOnHover,
      hoverColor: hoverColor,
      animationDuration: animationDuration,
      mouseCursor: SystemMouseCursors.click,
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    final effectiveTextStyle = style != null
        ? defaultTextStyle.style.merge(style)
        : defaultTextStyle.style;

    Widget textWidget = _buildText(effectiveTextStyle);

    if (isSelectable == true) {
      textWidget = SelectableText(
        text,
        textAlign: align,
        maxLines: maxLines,
        strutStyle: strutStyle,
        textDirection: textDirection,
        textScaleFactor: textScaleFactor,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        style: effectiveTextStyle,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
      );
    }

    Widget content = _buildInteractiveWrapper(
      child: _buildIconTextRow(
        textWidget: textWidget,
      ),
    );

    if (animateOnHover == true) {
      content = _buildHoverAnimation(content);
    }

    if (margin != null || constraints != null || decoration != null) {
      content = Container(
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        clipBehavior: clipBehavior ?? Clip.none,
        child: content,
      );
    }

    return content;
  }

  Widget _buildText(TextStyle effectiveTextStyle) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow,
      style: effectiveTextStyle.copyWith(
        shadows: shadows ??
            (shadowColor != null
                ? [
                    Shadow(
                      color: shadowColor!,
                      blurRadius: shadowBlurRadius ?? 2.0,
                      offset: shadowOffset ?? const Offset(1, 1),
                    )
                  ]
                : null),
      ),
      strutStyle: strutStyle,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }

  Widget _buildIconTextRow({required Widget textWidget}) {
    if (icon == null && customIcon == null && image == null) {
      return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: textWidget,
      );
    }

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: iconAlignment ?? MainAxisAlignment.start,
        children: [
          if (icon != null)
            Padding(
              padding: iconPadding ?? const EdgeInsets.only(right: 8.0),
              child: Icon(
                icon,
                color: iconColor ?? style?.color,
                size: iconSize ?? (style?.fontSize ?? 16.0) * 1.2,
              ),
            ),
          if (customIcon != null)
            Padding(
              padding: iconPadding ?? const EdgeInsets.only(right: 8.0),
              child: customIcon!,
            ),
          if (image != null)
            Padding(
              padding: iconPadding ?? const EdgeInsets.only(right: 8.0),
              child: Image(
                image: image!,
                width: imageSize ?? (style?.fontSize ?? 16.0) * 1.5,
                height: imageSize ?? (style?.fontSize ?? 16.0) * 1.5,
                color: iconColor ?? style?.color,
              ),
            ),
          Flexible(child: textWidget),
        ],
      ),
    );
  }

  Widget _buildInteractiveWrapper({required Widget child}) {
    final hasInteraction =
        onTap != null || onDoubleTap != null || onLongPress != null;

    if (!hasInteraction) return child;

    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      mouseCursor: mouseCursor ?? SystemMouseCursors.click,
      hoverColor: hoverColor ?? Colors.transparent,
      splashColor: splashColor ?? hoverColor?.withOpacity(0.1),
      highlightColor: highlightColor ?? hoverColor?.withOpacity(0.05),
      overlayColor: overlayColor,
      borderRadius: borderRadius != null
          ? BorderRadius.circular(borderRadius!)
          : BorderRadius.zero,
      child: showUnderlineOnHover == true
          ? MouseRegion(
              child: AnimatedDefaultTextStyle(
                duration:
                    animationDuration ?? const Duration(milliseconds: 200),
                curve: animationCurve ?? Curves.easeInOut,
                style: (style ?? const TextStyle()).copyWith(
                  decoration: style?.decoration ?? TextDecoration.none,
                ),
                child: child,
              ),
            )
          : child,
    );
  }

  Widget _buildHoverAnimation(Widget child) {
    return MouseRegion(
      cursor: mouseCursor ?? SystemMouseCursors.basic,
      child: TweenAnimationBuilder<double>(
        duration: animationDuration ?? const Duration(milliseconds: 200),
        curve: animationCurve ?? Curves.easeInOut,
        tween: Tween<double>(begin: 1.0, end: 1.0),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: child,
      ),
    );
  }

  AppText copyWith({
    String? text,
    TextAlign? align,
    int? maxLines,
    bool? softWrap,
    TextOverflow? overflow,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    double? textScaleFactor,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    bool? isSelectable,
    FocusNode? focusNode,
    bool? autofocus,
    IconData? icon,
    Widget? customIcon,
    ImageProvider? image,
    Color? iconColor,
    double? iconSize,
    double? imageSize,
    EdgeInsets? iconPadding,
    MainAxisAlignment? iconAlignment,
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
    MouseCursor? mouseCursor,
    bool? showUnderlineOnHover,
    Color? hoverColor,
    Color? splashColor,
    Color? highlightColor,
    WidgetStateProperty<Color?>? overlayColor,
    double? borderRadius,
    Duration? animationDuration,
    Curve? animationCurve,
    bool? animateOnHover,
    double? hoverScale,
    List<Shadow>? shadows,
    Color? shadowColor,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    EdgeInsets? padding,
    EdgeInsets? margin,
    AlignmentGeometry? alignment,
    double? width,
    double? height,
    BoxConstraints? constraints,
    Decoration? decoration,
    Clip? clipBehavior,
  }) {
    return AppText(
      key: key,
      text: text ?? this.text,
      align: align ?? this.align,
      maxLines: maxLines ?? this.maxLines,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textDirection: textDirection ?? this.textDirection,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      isSelectable: isSelectable ?? this.isSelectable,
      focusNode: focusNode ?? this.focusNode,
      autofocus: autofocus ?? this.autofocus,
      icon: icon ?? this.icon,
      customIcon: customIcon ?? this.customIcon,
      image: image ?? this.image,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      imageSize: imageSize ?? this.imageSize,
      iconPadding: iconPadding ?? this.iconPadding,
      iconAlignment: iconAlignment ?? this.iconAlignment,
      onTap: onTap ?? this.onTap,
      onDoubleTap: onDoubleTap ?? this.onDoubleTap,
      onLongPress: onLongPress ?? this.onLongPress,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      showUnderlineOnHover: showUnderlineOnHover ?? this.showUnderlineOnHover,
      hoverColor: hoverColor ?? this.hoverColor,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      overlayColor: overlayColor ?? this.overlayColor,
      borderRadius: borderRadius ?? this.borderRadius,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      animateOnHover: animateOnHover ?? this.animateOnHover,
      hoverScale: hoverScale ?? this.hoverScale,
      shadows: shadows ?? this.shadows,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      alignment: alignment ?? this.alignment,
      width: width ?? this.width,
      height: height ?? this.height,
      constraints: constraints ?? this.constraints,
      decoration: decoration ?? this.decoration,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

// This code defines a custom text widget in Flutter that supports various text styles, icons, images, and interactive features.
//this example is a simple text widget that can be customized with different styles, icons, and interactive features.
class Exmpletext extends StatelessWidget {
  const Exmpletext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Text Widget'),
      ),
      body: Column(
        children: [
          AppText.simple(
            'هذا نص بسيط',
            fontSize: 16,
            color: Colors.black,
          ),
          AppText.headingLarge(
            'عنوان رئيسي كبير',
            color: Colors.blue,
            align: TextAlign.center,
          ),
          AppText.headingMedium(
            'عنوان متوسط',
            color: Colors.green,
          ),
          AppText.bodyLarge(
            'هذا نص طويل يمكن أن يحتوي على عدة أسطر من المحتوى الذي يصف شيئاً ما في التطبيق',
            maxLines: 3,
          ),
          AppText.bodyMedium(
            text: 'نص متوسط الحجم مناسب للمحتوى الثانوي',
            color: Colors.grey[600],
          ),
          AppText.clickable(
            text: 'انقر هنا للإجراء',
            onTap: () {
              print('تم النقر على النص');
            },
          ),
          AppText(
            text: 'الإعدادات',
            icon: Icons.settings,
            iconColor: Colors.blue,
            style: TextStyle(fontSize: 18),
          ),
          AppText(
            text: 'المستخدم المميز',
            image: AssetImage('assets/premium.png'),
            imageSize: 20,
            style: TextStyle(color: Colors.amber),
          ),
          AppText(
            text: 'نص بظل',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
            shadows: [
              Shadow(color: Colors.black, blurRadius: 4, offset: Offset(2, 2)),
            ],
            padding: EdgeInsets.all(8),
          ),
          AppText(
            text: 'مرر المؤشر هنا',
            animateOnHover: true,
            hoverScale: 1.1,
            animationDuration: Duration(milliseconds: 300),
            style: TextStyle(fontSize: 18, color: Colors.purple),
          ),
          AppText(
            text: 'هذا نص يمكن تحديده ونسخه',
            isSelectable: true,
            style: TextStyle(fontSize: 16),
          ),
          AppText(
            text: 'نص بخلفية',
            style: TextStyle(color: Colors.white),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          AppText(
            text: 'إشعارات',
            customIcon: Badge(
              smallSize: 8,
              child: Icon(Icons.notifications),
            ),
            onTap: () => print('تم النقر على الإشعارات'),
            hoverColor: Colors.grey[200],
          ),
          AppText(
            text: 'هذا نص طويل جداً سيتم عرضه في مساحة محددة مع وجود حدود حوله',
            maxLines: 3,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          AppText(
            text: 'تدرج ألوان',
            style: TextStyle(
              fontSize: 24,
              foreground: Paint()
                ..shader = LinearGradient(
                  colors: [Colors.red, Colors.blue],
                ).createShader(Rect.fromLTWH(0, 0, 200, 20)),
            ),
          ),
          AppText(
            text: 'نص بحروف متباعدة',
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 2.0,
            ),
          ),
          AppText(
            text: 'هذا نص\nبمسافة بين الأسطر',
            style: TextStyle(
              fontSize: 16,
              height: 2.0,
            ),
          ),
          AppText(
            text: 'Hello مرحبًا',
            textDirection: TextDirection.ltr,
          ),
          AppText(
            text: 'نص متعدد التأثيرات',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            shadows: [
              Shadow(color: Colors.black, blurRadius: 6),
            ],
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 4),
              ],
            ),
            onTap: () => print('نص تفاعلي'),
            animateOnHover: true,
          ),
          AppText(
            text: 'اضغط هنا',
            icon: Icons.touch_app,
            iconColor: Colors.amber,
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple,
              decoration: TextDecoration.underline,
            ),
            onTap: () => print('تم الضغط'),
            hoverColor: Colors.deepPurple.withOpacity(0.1),
            animateOnHover: true,
            hoverScale: 1.05,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
        ],
      ),
    );
  }
}
