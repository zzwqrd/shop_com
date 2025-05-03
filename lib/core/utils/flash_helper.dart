import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../commonWidget/custom_image.dart';
import '../../core/utils/extensions.dart';
import '../../gen/assets/generated_assets.dart';
import '../routes/app_routes_fun.dart';

enum MessageTypeTost { success, fail, warning }

class FlashHelper {
  static Future<void> showToast(String msg,
      {int duration = 2, MessageTypeTost type = MessageTypeTost.fail}) async {
    if (msg.isEmpty) return;
    return showFlash(
      context: navigatorKey.currentContext!,
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          position: FlashPosition.top,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: _getBgColor(type)),
            child: Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 11.h),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                    child: CustomImage(
                      Assets.icons.logo,
                      fit: BoxFit.scaleDown,
                      height: 19.h,
                      width: 24.h,
                      color: _getBgColor(type),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    msg,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: context.regularText.copyWith(
                        fontSize: 16, color: context.primaryColorLight),
                  ),
                ),
                Container(
                  height: 24.h,
                  width: 24.h,
                  padding: EdgeInsets.all(5.r),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: CustomImage(
                    _getToastIcon(type),
                    height: 19.h,
                    width: 24.h,
                    color: _getBgColor(type),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 3000),
    );
  }

  static Color _getBgColor(MessageTypeTost msgType) {
    switch (msgType) {
      case MessageTypeTost.success:
        return "#53A653".color;
      case MessageTypeTost.warning:
        return "#FFCC00".color;
      default:
        return "#EF233C".color;
    }
  }

  static String _getToastIcon(MessageTypeTost msgType) {
    return Assets.icons.logo;
    // switch (msgType) {
    //   case MessageType.success:
    //     return Assets.svg.success;

    //   case MessageType.warning:
    //     return Assets.svg.warning;

    //   default:
    //     return Assets.svg.error;
    // }
  }
}
