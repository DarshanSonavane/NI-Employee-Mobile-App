import 'package:flutter/material.dart';
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
}
