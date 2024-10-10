import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to start
          children: [
            Flexible(
              flex: 15,
              child: Card(
                color: AppPallete.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppPallete.locationBackgroundWithOpacity,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      const Text(
                        'Total Visits: 29',
                        style: TextStyle(
                          color: AppPallete.label3Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Increased spacing for better layout
            Flexible(
              flex: 70,
              child: Card(
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
                                sections: showingSections(),
                                centerSpaceRadius: pieChartSize * 0.3,
                                sectionsSpace: 9,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ), // Adjusted spacing between PieChart and legend
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 20),
                              buildLegend('Open', AppPallete.pieCharOpen),
                              const SizedBox(width: 20),
                              buildLegend(
                                  'In-process', AppPallete.pieCharInProcess),
                              const SizedBox(width: 20),
                              buildLegend('Closed', AppPallete.pieCharClosed),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 15,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildLegend(String label, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: setBackgroundColor(label),
      borderRadius: BorderRadius.circular(4), // Rounded legend color box
    ),
    child: Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Color setBackgroundColor(String label) {
  if (label == 'Open') {
    return AppPallete.backgroundOpen;
  } else if (label == 'Closed') {
    return AppPallete.backgroundClosed;
  } else {
    return AppPallete.backgroundInProcess;
  }
}

List<PieChartSectionData> showingSections() {
  return [
    PieChartSectionData(
      color: Colors.red,
      value: 18,
      title: '18',
      radius: 60, // Adjusted the radius to fit within the container
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.orange,
      value: 18,
      title: '18',
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 36,
      title: '36',
      radius: 60,
      titleStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];
}
