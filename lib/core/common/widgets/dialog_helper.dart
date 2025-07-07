import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'simple_dialog_with_message.dart';

class DialogHelper {
  static void showAlertDialog({
    required BuildContext context,
    required String message,
    required VoidCallback onButtonPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialogWithMessage(
          message: message,
          onTap: onButtonPressed,
        );
      },
    );
  }

  static void showOpenSettingAlertDialog({
    required BuildContext context,
    required String message,
    required VoidCallback onTextButtonPressed,
    required VoidCallback onCloseButtonPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TextButtonDialogWithMessage(
          message: message,
          onTextTap: onTextButtonPressed,
          onCloseTap: onCloseButtonPressed,
        );
      },
    );
  }

  static void showPermissionDialog({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
            'This app needs access to your photo library to select images. Please grant permission in Settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }
}
