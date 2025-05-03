import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../commonWidget/app_btn.dart';
import '../../commonWidget/custom_image.dart';
import '../../core/utils/extensions.dart';
import '../routes/app_routes_fun.dart';

extension OnboardingUIExtension on BuildContext {
  /// Get the list of colors for onboarding pages
  List<Color> get onboardingColors => [
        '#FFBC0F'.color,
        '#113342'.color,
        '#00A585'.color,
      ];

  /// Build a page indicator for onboarding
  Widget buildPageIndicator({
    required int currentIndex,
    required int totalPages,
  }) {
    return Wrap(
      children: List.generate(
        totalPages,
        (index) => Icon(
          Icons.circle,
          size: 10.h,
          color: onboardingColors[currentIndex]
              .withOpacity(index == currentIndex ? 1 : 0.5),
        ).withPadding(horizontal: 3.w),
      ),
    );
  }

  /// Build an onboarding button
  Widget buildOnboardingButton({
    required VoidCallback onPressed,
    required String title,
    required Color backgroundColor,
    bool saveArea = false,
  }) {
    return EnhancedButton(
      onPressed: onPressed,
      includeSafeArea: saveArea,
      backgroundColor: backgroundColor,
      label: title,
    ).withPadding(top: 16.h, bottom: 12.h);
  }

  /// Build an onboarding image
  Widget buildOnboardingImage({
    required String imagePath,
    required double height,
    required double width,
    Widget? child,
  }) {
    return CustomImage(
      imagePath,
      height: height,
      width: width,
      child: child,
    );
  }

  /// Build a customizable bottom navigation bar for onboarding
  Widget buildOnboardingBottomNavigationBar({
    required int currentIndex,
    required VoidCallback onNextPressed,
    required VoidCallback onSkipPressed,
    required VoidCallback onFinishPressed,
    required List<Color> colors,
  }) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildPageIndicator(
            currentIndex: currentIndex,
            totalPages: 3,
          ),
          buildOnboardingButton(
            onPressed: currentIndex == 2 ? onFinishPressed : onNextPressed,
            title: currentIndex == 2 ? "home" : "next",
            backgroundColor: colors[currentIndex],
          ),
          Opacity(
            opacity: currentIndex == 2 ? 0 : 1,
            child: TextButton(
              onPressed: onSkipPressed,
              child: Text(
                "skip",
                style: navigatorKey.currentContext!.mediumText
                    .copyWith(fontSize: 14),
              ),
            ),
          ),
        ],
      ).withPadding(horizontal: 20.w),
    );
  }
}
