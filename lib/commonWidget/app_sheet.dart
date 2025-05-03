import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/extensions.dart';

class CustomAppSheet extends StatelessWidget {
  final String? title;
  final List<Widget>? children;
  final double? minHeight;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;

  const CustomAppSheet(
      {super.key,
      this.title,
      this.children,
      this.padding,
      this.minHeight,
      this.isScrollable = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: kToolbarHeight),
      child: Container(
        padding: padding,
        constraints: BoxConstraints(
            maxHeight: context.h - (kToolbarHeight + 30.h),
            minHeight: minHeight ?? 0.0),
        decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            borderRadius:
                BorderRadiusDirectional.vertical(top: Radius.circular(32.r))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExtensionWidget(Container(
              margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
              height: 5.h,
              width: 134.w,
              decoration: BoxDecoration(
                color: context.hintColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            )).center,
            if (title?.isNotEmpty == true)
              Text(
                title ?? "",
                style: context.boldText.copyWith(fontSize: 18),
                textAlign: TextAlign.start,
              ).withPadding(horizontal: 24.w),
            Flexible(
              child: isScrollable
                  ? SingleChildScrollView(
                      padding:
                          padding ?? EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: children ?? [],
                      ),
                    )
                  : Padding(
                      padding:
                          padding ?? EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: children ?? [],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
