import 'package:ali_com/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../commonWidget/app_text.dart';
import '../../../commonWidget/custom_image.dart';
import '../../../core/utils/app_colors.dart';
import '../controller/bloc.dart';

class CategoriesWidget extends StatelessWidget {
  final HomeController bloc;
  const CategoriesWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: bloc.categories.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              height: 100.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  width: 0.1,
                  color: AppColors.blackColor1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImage(
                    bloc.categories[index].thumbnail.toString(),
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.contain,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  MyTextApp.small(
                    title: bloc.categories[index].name.truncate(10),
                    align: TextAlign.center,
                  ).withPadding(vertical: 2.w)
                ],
              ).withPadding(vertical: 13.h),
            ).withPadding(horizontal: 7.w),
          ).center;
        },
      ),
    ).withPadding(horizontal: 15);
  }
}
