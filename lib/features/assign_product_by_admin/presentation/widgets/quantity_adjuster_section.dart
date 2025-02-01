import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/custom_global_text.dart';

class QuantityAdjusterSection extends StatelessWidget {
  final int assignedQuantity;
  final Function() onIncrement;
  final Function() onDecrement;

  const QuantityAdjusterSection({
    super.key,
    required this.assignedQuantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomGlolbalText(
          text: "Assigned Quantity: ",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppPallete.label3Color,
        ),
        IconButton(
          icon: const Icon(
            Icons.remove,
            color: AppPallete.errorColor,
          ),
          onPressed: onDecrement,
        ),
        CustomGlolbalText(
          text: "$assignedQuantity",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppPallete.label3Color,
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: AppPallete.gradientColor,
          ),
          onPressed: onIncrement,
        ),
      ],
    );
  }
}
