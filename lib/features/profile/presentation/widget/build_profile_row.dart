import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_global_text.dart';

class BuildProfileRow extends StatelessWidget {
  final String labelName;
  final String labelValue;
  final IconData icon;

  const BuildProfileRow({
    super.key,
    required this.labelName,
    required this.labelValue,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: AppPallete.blueColor,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomGlolbalText(
                text: labelName,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppPallete.deepNavy,
              ),
              const SizedBox(height: 4),
              CustomGlolbalText(
                text: labelValue,
                fontSize: 16,
                color: AppPallete.deepNavy,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
