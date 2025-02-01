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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
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
            color: textColor,
            fontSize: 16,
          ),
        ),
        isExpanded: true,
        underline: const SizedBox(), // Remove the default underline
        icon: Icon(Icons.arrow_drop_down, color: iconColor),
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
        dropdownColor: dropdownColor,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
