import 'package:flutter/material.dart';
import '../../app_theme/app_pallete.dart';

Text setTextNormal(
  String value,
  double scalingFactor,
) {
  return Text(
    textAlign: TextAlign.end,
    value,
    style: TextStyle(
      fontSize: 20 * scalingFactor,
      fontWeight: FontWeight.bold,
      color: AppPallete.gradientColor,
    ),
  );
}
