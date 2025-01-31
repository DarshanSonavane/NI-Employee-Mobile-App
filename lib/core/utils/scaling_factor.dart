import 'package:flutter/material.dart';

class ScalingFactor {
  static double _scalingFactor = 1.0;
  static void initialize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    _scalingFactor = screenWidth < 600 ? 0.75 : 1.0;
  }

  static double get scalingFactor => _scalingFactor;

  static double scale(double value) {
    return value * _scalingFactor;
  }
}
