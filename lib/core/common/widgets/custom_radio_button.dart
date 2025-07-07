import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';

class CustomRadioGroup<T> extends StatelessWidget {
  const CustomRadioGroup({
    super.key,
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
    required this.errorText,
    this.spacing = 16,
  });

  final String label;
  final List<T> options;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? errorText;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGlolbalText(
            text: label,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppPallete.label2Color,
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: spacing,
            runSpacing: 4,
            children: options.map((opt) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<T>(
                    value: opt,
                    groupValue: value,
                    onChanged: onChanged,
                    activeColor: AppPallete.gradientColor,
                    visualDensity: VisualDensity.compact,
                  ),
                  CustomGlolbalText(
                    text: opt.toString(),
                    color: AppPallete.label3Color,
                  ),
                ],
              );
            }).toList(),
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 4),
              child: CustomGlolbalText(
                  text: errorText!, color: AppPallete.errorColor),
            ),
        ],
      ),
    );
  }
}
