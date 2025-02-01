import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? value;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final AutovalidateMode? autovalidateMode;
  final bool? editableText;
  final String? initialValue;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField(
      {super.key,
      this.controller,
      required this.labelText,
      this.value,
      this.validator,
      this.textStyle,
      this.labelStyle,
      this.fillColor,
      this.autovalidateMode,
      this.editableText = true,
      this.initialValue,
      this.maxLines,
      this.minLines = 1,
      this.contentPadding});

  @override
  Widget build(BuildContext context) {
    if (controller != null &&
        (value?.isNotEmpty ?? false) &&
        controller!.text.isEmpty) {
      controller!.text = value!;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        initialValue:
            controller == null && value?.isNotEmpty == true ? value : null,
        readOnly: !editableText!,
        style: textStyle,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: labelStyle,
            hintText: value?.isEmpty ?? true ? 'Enter $labelText' : null,
            filled: true,
            alignLabelWithHint: true,
            fillColor: fillColor,
            border: const UnderlineInputBorder(),
            contentPadding: contentPadding),
        validator: validator,
        autovalidateMode: autovalidateMode,
      ),
    );
  }
}
