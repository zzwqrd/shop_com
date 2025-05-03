import 'package:flutter/material.dart';

import '../core/utils/app_colors.dart';

class MyTextApp extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final int? maxLines;

  final IconData? icon;
  final ImageProvider? image;
  final Color? iconColor;
  final double? iconSize;
  final double? imageSize;

  final VoidCallback? onTap; // إضافة onTap هنا فقط لحالة MyTextApp.nav

  const MyTextApp({
    super.key,
    required this.title,
    this.color,
    this.size,
    this.align,
    this.fontFamily,
    this.decoration,
    this.letterSpace,
    this.wordSpace,
    this.overflow,
    this.fontWeight,
    this.icon,
    this.image,
    this.iconColor,
    this.iconSize,
    this.imageSize,
    this.onTap,
    this.maxLines,
  });

  // Named constructor for bold text
  const MyTextApp.bold({
    super.key,
    required this.title,
    this.size = 18,
    this.align = TextAlign.center,
    this.fontFamily,
    this.decoration = TextDecoration.none,
    this.letterSpace,
    this.wordSpace,
    this.overflow = TextOverflow.ellipsis,
    this.icon,
    this.image,
    this.iconColor,
    this.iconSize,
    this.imageSize,
    this.maxLines,
  })  : fontWeight = FontWeight.bold,
        color = AppColors.mainColor,
        onTap = null;
  const MyTextApp.app({
    super.key,
    required this.title,
    // this.color,
    this.size = 18,
    this.align = TextAlign.start,
    this.fontFamily,
    this.decoration = TextDecoration.none,
    this.letterSpace,
    this.wordSpace,
    this.overflow = TextOverflow.ellipsis,
    this.icon,
    this.image,
    this.iconColor,
    this.iconSize,
    this.imageSize,
    this.maxLines,
  })  : fontWeight = FontWeight.bold,
        color = AppColors.mainColor,
        onTap = null;

  // Named constructor for small text
  const MyTextApp.small({
    super.key,
    required this.title,
    this.size = 12,
    this.align = TextAlign.start,
    this.fontFamily,
    this.decoration = TextDecoration.none,
    this.letterSpace,
    this.wordSpace,
    this.overflow = TextOverflow.clip,
    this.icon,
    this.image,
    this.iconColor,
    this.iconSize,
    this.imageSize,
    this.maxLines,
  })  : fontWeight = FontWeight.normal,
        color = AppColors.mainColor,
        onTap = null;

  // Named constructor for headings
  const MyTextApp.heading({
    super.key,
    required this.title,
    this.color = Colors.black,
    this.size = 24,
    this.align = TextAlign.center,
    this.fontFamily,
    this.decoration = TextDecoration.none,
    this.letterSpace = 1.2,
    this.wordSpace,
    this.overflow = TextOverflow.ellipsis,
    this.icon,
    this.image,
    this.iconColor,
    this.iconSize,
    this.imageSize,
    this.maxLines,
  })  : fontWeight = FontWeight.bold,
        onTap = null;

  // Named constructor for navigable text
  const MyTextApp.nav({
    super.key,
    required this.title,
    this.color =
        Colors.blue, // يمكن تعديل اللون الافتراضي ليشير إلى قابلية النقر
    this.size = 16,
    this.align = TextAlign.start,
    this.fontFamily,
    this.decoration =
        TextDecoration.underline, // underline to indicate it's clickable
    this.letterSpace,
    this.wordSpace,
    this.overflow = TextOverflow.ellipsis,
    this.icon,
    this.image,
    this.iconColor,
    this.iconSize,
    this.imageSize,
    this.maxLines,
    required this.onTap, // onTap is required for navigation
  }) : fontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    // حالة MyTextApp.nav التي تقبل النقر
    return onTap != null
        ? InkWell(
            onTap: onTap,
            child: _buildTextRow(),
          )
        : _buildTextRow();
  }

  MyTextApp copyWith({
    String? title,
    Color? color,
    double? size,
    TextAlign? align,
    String? fontFamily,
    TextDecoration? decoration,
    double? letterSpace,
    double? wordSpace,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    IconData? icon,
    ImageProvider? image,
    Color? iconColor,
    double? iconSize,
    double? imageSize,
    VoidCallback? onTap,
    int? maxLines,
  }) {
    return MyTextApp(
      title: title ?? this.title,
      color: color ?? this.color,
      size: size ?? this.size,
      align: align,
      fontFamily: fontFamily,
      decoration: decoration,
      letterSpace: letterSpace,
      wordSpace: wordSpace,
      overflow: overflow,
      fontWeight: fontWeight,
      icon: icon,
      image: image,
      iconColor: iconColor,
      iconSize: iconSize,
      imageSize: imageSize,
      onTap: onTap,
      maxLines: maxLines,
    );
  }

  // Method to build the row with optional icon or image and text
  Widget _buildTextRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          Icon(
            icon,
            color: iconColor ?? Colors.black,
            size: iconSize ?? size ?? 16,
          ),
        if (image != null)
          Image(
            image: image!,
            width: imageSize ?? 24,
            height: imageSize ?? 24,
          ),
        SizedBox(width: (icon != null || image != null) ? 8.0 : 0),
        Text(
          title,
          textAlign: align ?? TextAlign.start,
          style: TextStyle(
            color: color,
            fontSize: size,
            letterSpacing: letterSpace,
            wordSpacing: wordSpace,
            decoration: decoration ?? TextDecoration.none,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontFamily: fontFamily ?? 'Roboto',
          ),
          overflow: overflow,
        ),
      ],
    );
  }
}
