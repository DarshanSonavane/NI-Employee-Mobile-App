import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final AutovalidateMode? autovalidateMode;
  final bool? editableText;
  final String? initialValue;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.labelText,
    this.validator,
    this.textStyle,
    this.labelStyle,
    this.fillColor,
    this.autovalidateMode,
    this.editableText = true,
    this.initialValue,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    if (controller != null &&
        initialValue != null &&
        controller!.text.isEmpty) {
      controller!.text = initialValue!;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        initialValue: controller == null ? initialValue : null,
        readOnly: !editableText!,
        style: textStyle,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          filled: true,
          alignLabelWithHint: true,
          fillColor: fillColor,
          border: const UnderlineInputBorder(),
        ),
        validator: validator,
        autovalidateMode: autovalidateMode,
      ),
    );
  }
}
