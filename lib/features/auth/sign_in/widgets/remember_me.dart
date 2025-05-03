import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';

class RememberMeRow extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onCheckboxChanged;

  const RememberMeRow({
    super.key,
    required this.isChecked,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                onCheckboxChanged(!isChecked);
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isChecked ? Color(0xFF99CC82) : Colors.grey.shade300,
                  border: Border.all(
                    color: isChecked ? Color(0xFF99CC82) : Colors.grey,
                    width: 2,
                  ),
                ),
                child: isChecked
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const Text(
              'تذكرني',
              style: TextStyle(
                color: Color(0xFF99CC82),
                fontSize: 16,
              ),
            ).withPadding(horizontal: 7),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'نسيت كلمة المرور؟',
            style: TextStyle(
              color: Color(0xFF99CC82),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
