import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/constants/constants.dart';

class GenericDropdown extends StatelessWidget {
  final String dropDownType;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final List<Map<String, dynamic>> options;

  const GenericDropdown({
    super.key,
    required this.dropDownType,
    required this.selectedValue,
    required this.onChanged,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: '$dropDownType*',
        labelStyle: const TextStyle(color: AppPallete.label3Color),
        filled: true,
        fillColor: AppPallete.backgroundClosed,
        // Define borders for all states with rounded edges
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppPallete.label2Color, width: 1.0),
          borderRadius: BorderRadius.circular(12.0), // Increased border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppPallete.label2Color, width: 2.0),
          borderRadius: BorderRadius.circular(12.0), // Increased border radius
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(12.0), // Increased border radius
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(12.0), // Increased border radius
        ),
        border: OutlineInputBorder(
          borderSide:
              const BorderSide(color: AppPallete.label2Color, width: 1.0),
          borderRadius: BorderRadius.circular(12.0), // Increased border radius
        ),
      ),
      style: const TextStyle(
        color: AppPallete.label3Color,
        fontSize: 20,
      ),
      value: selectedValue,
      items: options
          .map((option) => DropdownMenuItem<String>(
                value: option['label'],
                child: Text(
                  option['label'],
                  style: const TextStyle(color: AppPallete.label3Color),
                ),
              ))
          .toList(),
      onChanged: onChanged,
      dropdownColor: AppPallete.backgroundClosed,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppPallete.label3Color,
      ),
      validator: (value) => value == null ? Constants.machineDropDown : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
