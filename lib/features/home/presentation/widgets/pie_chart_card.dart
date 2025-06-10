import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:employee_ni_service/features/home/presentation/widgets/pie_char_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';

import '../../../../core/common/widgets/build_legends.dart';

class PieChartCard extends StatelessWidget {
  final ResponseHomeDetails homeDetailsValue;
  const PieChartCard({super.key, required this.homeDetailsValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double pieChartSize = constraints.maxHeight * 0.8;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: pieChartSize,
                  child: PieChart(
                    PieChartData(
                      sections: showingSections(homeDetailsValue),
                      centerSpaceRadius: pieChartSize * 0.3,
                      sectionsSpace: 9,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    BuildLegends('Open', AppPallete.pieCharOpen),
                    SizedBox(width: 20),
                    BuildLegends('In-process', AppPallete.pieCharInProcess),
                    SizedBox(width: 20),
                    BuildLegends('Closed', AppPallete.pieCharClosed),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
