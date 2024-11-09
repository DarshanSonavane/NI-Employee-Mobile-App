import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';

Row setHeadingText(
  IconData iconData,
  String? value,
  String headerText,
  double scalingFactor,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        iconData,
        color: AppPallete.gradientColor,
        size: 24 * scalingFactor,
      ),
      SizedBox(width: 8 * scalingFactor),
      Text(
        headerText,
        style: TextStyle(
          fontSize: 18 * scalingFactor,
          color: AppPallete.gradientColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      Expanded(
        child: Text(
          value?.isNotEmpty == true ? value! : 'N/A',
          style: TextStyle(
            fontSize: 18 * scalingFactor,
            color: AppPallete.label3Color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  );
}
