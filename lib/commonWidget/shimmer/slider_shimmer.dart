import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SliderSectionShimmer extends StatelessWidget {
  const SliderSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        height: 132.h,
        width: 328.w,
        color: Colors.white,
      ),
    );
  }
}
