import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';

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
              Text(
                labelName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppPallete.backgroundColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                labelValue,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppPallete.backgroundColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
