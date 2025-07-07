import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

/// Reusable search field styled to match `CustomFormBuilderTextField`.
class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool autoFocus;

  const CustomSearchField({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = 'Search by name',
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search, color: AppPallete.gradientColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppPallete.gradientColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: AppPallete.gradientColor, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: const TextStyle(fontSize: 16, color: AppPallete.label3Color),
      ),
    );
  }
}
