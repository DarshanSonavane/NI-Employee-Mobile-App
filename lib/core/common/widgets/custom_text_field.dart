import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../features/f_service_request/presentation/widgets/otp_input_formatter.dart';

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
  final bool isOtpField;
  final void Function(String)? onChanged;
  final bool? isDisabled;
  final bool isNumberField;

  const CustomTextFormField({
    super.key,
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
    this.contentPadding,
    this.isOtpField = false,
    this.onChanged,
    this.isDisabled,
    this.isNumberField = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled ?? false;
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
        readOnly: !editableText! || disabled,
        style: textStyle,
        maxLines: maxLines,
        minLines: minLines,
        textAlign: isOtpField ? TextAlign.center : TextAlign.left,
        keyboardType: isOtpField || isNumberField
            ? TextInputType.number
            : TextInputType.text,
        inputFormatters: isOtpField
            ? [OtpInputFormatter()]
            : (isNumberField ? [FilteringTextInputFormatter.digitsOnly] : null),
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: labelStyle,
            hintText: value?.isEmpty ?? true ? 'Enter $labelText' : null,
            filled: true,
            alignLabelWithHint: true,
            fillColor: fillColor,
            border: const UnderlineInputBorder(),
            floatingLabelBehavior: disabled
                ? FloatingLabelBehavior.never
                : FloatingLabelBehavior.auto,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
        validator: validator,
        autovalidateMode: autovalidateMode,
        onChanged: onChanged,
      ),
    );
  }
}
