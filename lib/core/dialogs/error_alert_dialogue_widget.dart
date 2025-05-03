import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routes/app_routes_fun.dart';

showErrorDialogue(String error) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => ErrorAlertDialogueWidget(
      title: error,
    ),
  );
}

class ErrorAlertDialogueWidget extends StatelessWidget {
  final String title;
  const ErrorAlertDialogueWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF282F37),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 40,
            width: 150.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
