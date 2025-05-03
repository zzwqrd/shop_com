import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtonType {
  static const PRIMARY = "PRIMARY";
  static const SECONDARY = "SECONDARY";
  static const TERTIARY = "TERTIARY";
}

class AppButton extends StatelessWidget {
  final bool loading;
  final double height;
  final double? width;
  final double radius;
  final Function? onTap;
  final bool disabled;
  final String type;
  final IconData? icon;
  final String label;
  final Color? color;
  final TextStyle? labelStyle;
  final Color? borderColor;

  const AppButton({
    super.key,
    this.loading = false,
    this.height = 42,
    this.width,
    this.color,
    this.radius = 10,
    this.onTap,
    this.disabled = false,
    this.type = AppButtonType.PRIMARY,
    this.icon,
    this.label = "Button",
    this.labelStyle,
    this.borderColor,
  });

  getBgColor() {
    switch (type) {
      case AppButtonType.PRIMARY:
        return disabled || loading ? Colors.grey : Colors.purple;
      case AppButtonType.TERTIARY:
        return disabled || loading ? Colors.grey : Colors.white;
      default:
        return Colors.transparent;
    }
  }

  getButtonBorder() {
    return Border.all(
        width: 1, color: disabled ? Colors.grey : borderColor ?? Colors.purple);
  }

  getTextColor() {
    switch (type) {
      case AppButtonType.PRIMARY:
        return Colors.white;

      case AppButtonType.SECONDARY:
        return disabled ? Colors.grey : Colors.white;

      case AppButtonType.TERTIARY:
        return Colors.purple;
    }
  }

  getProgressBgColor() {
    if (type == AppButtonType.PRIMARY) {
      return Colors.white70;
    } else {
      return Colors.purple;
    }
  }

  getProgressAnimatedColor() {
    if (type == AppButtonType.PRIMARY) {
      return Colors.black26;
    } else {
      return Colors.white70;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: height,
          width:
              loading ? 42 : width ?? MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: color ?? getBgColor(),
            border: getButtonBorder(),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: InkWell(
            onTap: () => loading || disabled ? null : onTap!(),
            splashColor: Colors.white60,
            child: Center(
              child: loading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: getProgressBgColor(),
                        valueColor: AlwaysStoppedAnimation<Color>(
                            getProgressAnimatedColor()),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Icon(
                            icon,
                            size: 20,
                            color: getTextColor(),
                          ),
                        if (icon != null) SizedBox(width: 4.w),
                        Flexible(
                          flex: 1,
                          child: Text(label,
                              style: labelStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: getTextColor(),
                                          fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
