import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/extensions.dart';
import '../gen/assets/generated_assets.dart';
import 'custom_image.dart';

class SuccessfullySheet extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Function? onLottieFinish;

  const SuccessfullySheet({
    super.key,
    required this.title,
    this.onLottieFinish,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          color: context.splashColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5.h,
                width: 134.w,
                margin: EdgeInsets.only(top: 21.h, bottom: 8.h),
                decoration: BoxDecoration(
                    color: context.hintColor,
                    borderRadius: BorderRadius.circular(20.r)),
              ),
              CustomImage(
                Assets.icons.successfly,
                onFinishLottie: () {
                  Navigator.pop(context);
                  onLottieFinish?.call();
                },
                height: 160.h,
              ).withPadding(top: 40.h, bottom: 16.h),
              Text(
                title,
                style: context.mediumText.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ).withPadding(top: 10.h, bottom: 10.h),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: context.regularText
                      .copyWith(fontSize: 14, color: context.hintColor),
                  textAlign: TextAlign.center,
                ).withPadding(top: 10.h, bottom: 10.h),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
