import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/app_colors.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 13.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[300]!,
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white),
                ),
              ),
              Row(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[300]!,
                    child: Container(
                      height: 30.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: SizedBox(
            height: 500.h,
            child: GridView.builder(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 17),
                itemCount: 4,
                itemBuilder: (BuildContext ctx, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[300]!,
                    child: Container(
                      height: 207.h,
                      width: 156.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                          border: Border.all(color: AppColors.borderColor)),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
