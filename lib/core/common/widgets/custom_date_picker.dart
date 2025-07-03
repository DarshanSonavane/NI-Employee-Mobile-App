// custom_date_picker_field.dart
import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final String name;
  final String label;
  final DateTime? initialValue;
  final DateTime firstDate;
  final DateTime lastDate;
  final IconData? prefixIcon;
  final List<String? Function(DateTime?)>? validators;

  const CustomDatePicker({
    super.key,
    required this.name,
    required this.label,
    this.initialValue,
    required this.firstDate,
    required this.lastDate,
    this.prefixIcon,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderDateTimePicker(
        name: name,
        initialValue: initialValue,
        inputType: InputType.date,
        format: DateFormat('dd-MM-yyyy'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        firstDate: firstDate,
        lastDate: lastDate,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: AppPallete.label2Color,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: AppPallete.gradientColor)
              : null,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          errorStyle: const TextStyle(
            color: AppPallete.errorColor,
            fontSize: 14,
          ),
        ),
        style: const TextStyle(fontSize: 16, color: AppPallete.label3Color),
        validator: FormBuilderValidators.compose(validators ?? []),
      ),
    );
  }
}
