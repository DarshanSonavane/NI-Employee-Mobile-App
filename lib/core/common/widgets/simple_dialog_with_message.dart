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

class TextButtonDialogWithMessage extends StatelessWidget {
  final String message;
  final Function() onTextTap;
  final Function() onCloseTap;
  const TextButtonDialogWithMessage(
      {super.key,
      required this.message,
      required this.onTextTap,
      required this.onCloseTap});

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
          onPressed: onTextTap,
          child: const Text(
            "Open Settings",
            style: TextStyle(color: AppPallete.gradientColor),
          ),
        ),
        TextButton(
          onPressed: onCloseTap,
          child: const Text(
            'Close',
            style: TextStyle(color: AppPallete.gradientColor),
          ),
        ),
      ],
    );
  }
}
