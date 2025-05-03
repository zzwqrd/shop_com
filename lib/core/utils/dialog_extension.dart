// الامتداد لـ BuildContext
import 'package:flutter/material.dart';

import '../../../gen/assets/generated_assets.dart';
import '../../commonWidget/custom_image.dart';
import '../../core/utils/animation_extension.dart';

// الامتداد لـ BuildContext
extension DialogExtension on BuildContext {
  void showCustomDialog({
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Stack(
            alignment: Alignment.center,
            children: [
              CustomImage(
                Assets.icons.shieldDone,
                width: 50,
              ),
              Positioned(
                right: 0,
                top: 0,
                left: 70,
                child: CustomImage(
                  Assets.icons.delete,
                  width: 15,
                ),
              ),
            ],
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // إغلاق الحوار عند الإلغاء
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFF4CAF50), width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "إلغاء",
                  style: TextStyle(color: Color(0xFF4CAF50), fontSize: 16),
                ),
              ),
            ).toExpanded,
            TextButton(
              onPressed: () {
                onConfirm(); // تنفيذ الفعل عند التأكيد
                Navigator.of(dialogContext).pop(); // إغلاق الحوار
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFF4CAF50), width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "تأكيد",
                  style: TextStyle(color: Color(0xFF4CAF50), fontSize: 16),
                ),
              ),
            ).toExpanded,
          ],
        ).scaleIn(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}

// الامتداد لتحويل أي ويدجت إلى Expanded
extension WidgetExtensions on Widget {
  Widget get toExpanded => Expanded(child: this);
}
 // context.showCustomDialog(
//   title: "تأكيد التسجيل",
//   content: "هل أنت متأكد أنك تريد التسجيل؟",
//   onConfirm: () {},
// );