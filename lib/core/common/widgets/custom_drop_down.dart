import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? value;
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;
  final double borderRadius;
  final Color iconColor;
  final Color textColor;
  final Color dropdownColor;
  final bool? isEnabled;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.padding,
    this.borderColor = Colors.grey,
    this.borderRadius = 8.0,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.dropdownColor = Colors.white,
    this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final bool enabled = isEnabled ?? true;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: enabled ? borderColor : AppPallete.label2Color,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12.0),
      child: DropdownButton<T>(
        value: value,
        hint: Text(
          hintText,
          style: TextStyle(
            color: enabled ? textColor : AppPallete.label2Color,
            fontSize: 16,
          ),
        ),
        isExpanded: true,
        underline: const SizedBox(), // Remove the default underline
        icon: Icon(
          Icons.arrow_drop_down,
          color: enabled ? iconColor : AppPallete.label2Color,
        ),
        style: TextStyle(
          color: enabled ? textColor : AppPallete.label2Color,
          fontSize: 16,
        ),
        dropdownColor: dropdownColor,
        items: items,
        onChanged: enabled ? onChanged : null,
      ),
    );
  }
}
