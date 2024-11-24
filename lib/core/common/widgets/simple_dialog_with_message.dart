import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

class SimpleDialogWithMessage extends StatelessWidget {
  final String message;
  final Function() onTap;
  const SimpleDialogWithMessage(
      {super.key, required this.message, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppPallete.backgroundColor,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          color: AppPallete.label3Color,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onTap,
          child: const Text(
            'Close',
            style: TextStyle(color: AppPallete.gradientColor),
          ),
        ),
      ],
    );
  }
}
