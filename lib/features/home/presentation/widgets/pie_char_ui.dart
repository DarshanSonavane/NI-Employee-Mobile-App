import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../data/model/response_home_details.dart';

List<PieChartSectionData> showingSections(
    ResponseHomeDetails homeDetailsValue) {
  final openRaw = homeDetailsValue.openComplaints?.toDouble() ?? 0;
  final closedRaw = homeDetailsValue.closeComplaints?.toDouble() ?? 0;
  final inProcessRaw = homeDetailsValue.totalComplaints?.toDouble() ?? 0;
  final total = openRaw + closedRaw + inProcessRaw;
  const double minDisplayValue = 300;

  double adjustForDisplay(double value) {
    if (value == 0) return 0;
    double percent = (value / total) * 100;
    return percent < 2 ? minDisplayValue : value;
  }

  return [
    PieChartSectionData(
      color: AppPallete.pieCharOpen,
      value: adjustForDisplay(openRaw),
      title: openRaw.toInt().toString(),
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: AppPallete.orangeColor,
      value: adjustForDisplay(inProcessRaw),
      title: inProcessRaw.toInt().toString(),
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: AppPallete.pieCharClosed,
      value: adjustForDisplay(closedRaw),
      title: closedRaw.toInt().toString(),
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}
