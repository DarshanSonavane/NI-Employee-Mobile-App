import 'package:flutter/material.dart';
import '../../app_theme/app_pallete.dart';

Text setTextNormal(String value, double scalingFactor,
    {color = AppPallete.gradientColor,
    double fontSize = 20,
    Padding? padding}) {
  return Text(
    textAlign: TextAlign.end,
    value,
    style: TextStyle(
      fontSize: fontSize * scalingFactor,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}
