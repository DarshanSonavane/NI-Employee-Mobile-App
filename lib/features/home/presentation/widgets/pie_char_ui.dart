import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../data/model/response_home_details.dart';

List<PieChartSectionData> showingSections(
    ResponseHomeDetails homeDetailsValue) {
  double totalComplaintsValue = homeDetailsValue.totalComplaints!.toDouble();
  double closedComplaintsValue = homeDetailsValue.closeComplaints!.toDouble();
  // double openComplaintsValue =
  //     homeDetailsValue.openComplaints?.toDouble() ?? 0.0;

  return [
    PieChartSectionData(
      color: AppPallete.pieCharOpen,
      value: 700,
      title: "700".toString(),
      radius: 60, // Adjusted the radius to fit within the container
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: AppPallete.orangeColor,
      value: totalComplaintsValue,
      title: totalComplaintsValue.toString(),
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: AppPallete.pieCharClosed,
      value: closedComplaintsValue,
      title: closedComplaintsValue.toString(),
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}
