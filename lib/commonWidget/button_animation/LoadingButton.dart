import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../commonWidget/button_animation/loading_app.dart';
import '../../core/utils/app_colors.dart';
import '../app_text.dart';
import 'button_animation.dart';

class LoadingButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final bool isAnimating; // إضافة الخاصية isAnimating

  const LoadingButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    required this.isAnimating, // إضافة الخاصية هنا
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: CustomButtonAnimation(
        isAnimating: isAnimating, // تمرير isAnimating
        onTap: onTap,
        width: width ?? MediaQuery.of(context).size.width,
        minWidth: 55.w,
        height: height ?? 55.h,
        color: color ?? AppColors.primaryColor,
        borderRadius: borderRadius ?? 50,
        borderSide: BorderSide(
          color: borderColor ??
              const Color.fromARGB(0, 255, 255, 255).withOpacity(0.0),
          width: 1.w,
        ),
        loader: const LoadingBtn(),
        child: MyTextApp(
          title: title,
          size: fontSize ?? 11,
          color: textColor ?? Colors.white,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
