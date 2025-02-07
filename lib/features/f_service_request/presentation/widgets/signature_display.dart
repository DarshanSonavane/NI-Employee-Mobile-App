import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';

class SignatureDisplay extends StatelessWidget {
  final String signature;
  final String label;
  final VoidCallback onDelete;

  const SignatureDisplay({
    super.key,
    required this.signature,
    required this.label,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomGlolbalText(
          text: label,
          color: AppPallete.label2Color,
          fontSize: 18.0,
        ),
        if (signature.isNotEmpty)
          GestureDetector(
            onTap: onDelete,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
