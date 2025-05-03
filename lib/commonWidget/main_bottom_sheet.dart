import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/extensions.dart';

mainBottomSheet(BuildContext context, {required Widget widget}) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: context.scaffoldBackgroundColor,
    constraints: BoxConstraints(maxHeight: 700.h),
    context: context,
    builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 24.h),
                width: 132.w,
                height: 4.h,
                decoration: BoxDecoration(
                    color: context.hintColor,
                    borderRadius: BorderRadius.circular(100.r)),
              ),
            ),
            Flexible(child: widget),
          ],
        )),
  );
}
