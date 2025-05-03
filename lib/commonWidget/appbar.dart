import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../commonWidget/custom_image.dart';
import '../../gen/assets/generated_assets.dart';
import '../core/utils/app_colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      this.onTap,
      this.svgIcon,
      this.title,
      required this.isSearch});

  final void Function()? onTap;
  final String? svgIcon;
  final String? title;
  final bool? isSearch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryBackgroundColor,
      elevation: 0,
      toolbarHeight: 48.h,
      leadingWidth: 130.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: CustomImage(
          Assets.icons.appLogo,
          height: 20.h,
          width: 73.w,
        ),
      ),
      title: Text(
        title ?? "",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.textColor,
        ),
      ),
      actions: [
        isSearch == true
            ? GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding: EdgeInsets.only(right: 16.w, left: 16.w),
                  child: CustomImage(
                    svgIcon ?? "",
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
