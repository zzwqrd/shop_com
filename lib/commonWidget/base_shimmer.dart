import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core/utils/extensions.dart';

class BaseShimmer extends StatelessWidget {
  final Widget child;
  const BaseShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: context.hintColor.withOpacity(.2),
      baseColor: context.hintColor.withOpacity(.5),
      child: child,
    );
  }
}
