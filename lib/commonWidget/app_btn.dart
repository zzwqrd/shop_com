import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/extensions.dart';
import 'app_text.dart';
import 'loading.dart';

class EnhancedButton extends StatelessWidget {
  /// The text displayed on the button.
  final String? label;

  /// The callback function when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether the button is in a loading state.
  final bool isLoading;

  /// Whether the button is enabled.
  final bool isEnabled;

  /// Background color of the button.
  final Color? backgroundColor;

  /// Text color of the button.
  final Color? textColor;

  /// Optional icon to display before the text.
  final Widget? leadingIcon;

  /// Whether to include safe area padding at the bottom.
  final bool includeSafeArea;

  /// Height of the button.
  final double? height;

  /// Width of the button.
  final double? width;

  /// Font size of the text.
  final double? fontSize;

  /// Whether to show a border around the button.
  final bool showBorder;

  const EnhancedButton({
    super.key,
    this.label,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.leadingIcon,
    this.includeSafeArea = true,
    this.height,
    this.width,
    this.fontSize,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: includeSafeArea,
      child: ElevatedButton(
        onPressed: _handlePress(context),
        style: _buildButtonStyle(context),
        child: _buildButtonContent(context),
      ),
    );
  }

  /// Handles the button press logic.
  VoidCallback? _handlePress(BuildContext context) {
    return (isLoading || !isEnabled) ? null : onPressed;
  }

  /// Builds the button's style.
  ButtonStyle _buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      elevation: WidgetStateProperty.all(0),
      side: showBorder
          ? WidgetStateProperty.all(
              BorderSide(
                color: textColor ?? Colors.transparent,
                width: 1.0,
              ),
            )
          : null,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (isLoading || !isEnabled) {
          return (backgroundColor ?? context.secondaryColor).withOpacity(0.4);
        }
        return backgroundColor ?? context.primaryColor;
      }),
    );
  }

  /// Builds the content inside the button.
  Widget _buildButtonContent(BuildContext context) {
    return Container(
      height: height ?? 55.h,
      width: width ?? context.w,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLoadingIndicator(context),
          _buildLabelText(context),
        ],
      ),
    );
  }

  /// Builds the loading indicator.
  Widget _buildLoadingIndicator(BuildContext context) {
    return CustomProgress(
      size: 15.h,
      color: (textColor ?? context.primaryColorLight)
          .withOpacity(isLoading ? 1 : 0),
    );
  }

  /// Builds the label text and optional icon.
  Widget _buildLabelText(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) ...[
              leadingIcon!.withPadding(end: 4.w),
            ],
            if (label?.isNotEmpty == true) ...[
              MyTextApp.small(
                title: label!,
              ),
              // Text(
              //   label!,
              //   style: context.semiboldText.copyWith(
              //     fontSize: fontSize ?? 12.sp,
              //     height: 1.0,
              //     color: textColor ?? context.primaryColorLight,
              //   ),
              // ),
            ],
          ],
        ),
      ),
    );
  }
}
