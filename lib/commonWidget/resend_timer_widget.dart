import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/extensions.dart';
import 'custom_timer.dart';
import 'loading.dart';

class ResendTimerWidget extends StatefulWidget {
  final Function onTap;
  final bool loading;
  final CustomTimerController timer;
  const ResendTimerWidget(
      {super.key,
      required this.onTap,
      required this.loading,
      required this.timer});

  @override
  State<ResendTimerWidget> createState() => _ResendTimerWidgetState();
}

class _ResendTimerWidgetState extends State<ResendTimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    widget.timer.timer?.isActive == true ? "resend" : "resend",
                style: context.mediumText.copyWith(fontSize: 14),
              ),
              const TextSpan(text: " "),
              TextSpan(
                text: "resend",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (widget.timer.timer?.isActive != true)
                      widget.onTap.call();
                  },
                style: context.mediumText.copyWith(
                    fontSize: 14,
                    color: widget.timer.timer?.isActive == false
                        ? context.primaryColor
                        : context.hintColor),
              ),
            ],
          ),
        ),
        if (widget.loading)
          CustomProgress(size: 12.h).withPadding(horizontal: 10.w),
        const Spacer(),
        CustomTimerWidget(
          autoStart: true,
          onFinish: () {
            setState(() {});
          },
          builder: (tiker) {
            return Text(
              "${"${tiker.minutes}".padLeft(2, "0")}:${"${tiker.seconds}".padLeft(2, "0")}",
              style: context.regularText
                  .copyWith(fontSize: 14, color: context.hintColor),
            );
          },
          controller: widget.timer,
        ),
      ],
    );
  }
}
