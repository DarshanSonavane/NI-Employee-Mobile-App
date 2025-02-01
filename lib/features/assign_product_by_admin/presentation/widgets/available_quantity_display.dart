import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/custom_global_text.dart';

class AvailableQuantityDisplay extends StatelessWidget {
  final int availableQuantity;

  const AvailableQuantityDisplay({
    super.key,
    required this.availableQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomGlolbalText(
          text: "Available Quantity: ",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppPallete.label3Color,
        ),
        CustomGlolbalText(
          text: "$availableQuantity",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppPallete.errorColor,
        ),
      ],
    );
  }
}
