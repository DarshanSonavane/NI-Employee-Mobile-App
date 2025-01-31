import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:flutter/material.dart';

import 'pie_chart_card.dart';

class BuildPieCharCard extends StatelessWidget {
  final ResponseHomeDetails? homeDetailsValue;
  const BuildPieCharCard(this.homeDetailsValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: homeDetailsValue != null
          ? PieChartCard(
              homeDetailsValue: homeDetailsValue!,
            )
          : const Center(
              child: Text(
                'No Chart Data Available',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
    );
  }
}
