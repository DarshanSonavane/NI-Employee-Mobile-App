import 'package:flutter/material.dart';

import '../../app_theme/app_pallete.dart';

Row setHeadingText(
    IconData? iconData,
    String? value,
    String headerText,
    double scalingFactor,
    double fontSize,
    Color labelcolor,
    Color labelValueColor) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (iconData != null)
        Icon(
          iconData,
          color: AppPallete.gradientColor,
          size: 24 * scalingFactor,
        ),
      if (iconData != null) SizedBox(width: 8 * scalingFactor),
      Text(
        headerText,
        style: TextStyle(
          fontSize: 18 * scalingFactor,
          color: labelcolor,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(width: 8 * scalingFactor),
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            value?.isNotEmpty == true ? value! : 'N/A',
            style: TextStyle(
              fontSize: 16 * scalingFactor,
              color: labelValueColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ],
  );
}
