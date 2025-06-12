import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomFormBuilderTextField extends StatelessWidget {
  final String name;
  final String label;
  final String? hintText;
  final IconData? prefixIcon;
  final List<FormFieldValidator<String>>? validators;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomFormBuilderTextField({
    super.key,
    required this.name,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.validators,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderTextField(
        name: name,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          labelStyle: const TextStyle(
            color: AppPallete.label2Color,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.blueAccent)
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppPallete.gradientColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: AppPallete.gradientColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppPallete.errorColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: AppPallete.errorColor, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: const TextStyle(fontSize: 16, color: AppPallete.label3Color),
        validator: validators != null
            ? FormBuilderValidators.compose(validators!)
            : null,
      ),
    );
  }
}
