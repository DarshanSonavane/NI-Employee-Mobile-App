import 'package:flutter/services.dart';

class OtpInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (digitsOnly.length > 4) {
      digitsOnly = digitsOnly.substring(0, 4); // Ensure max length is 4
    }

    String formattedText = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && (i % 1 == 0)) {
        formattedText += ' - ';
      }
      formattedText += digitsOnly[i];
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
