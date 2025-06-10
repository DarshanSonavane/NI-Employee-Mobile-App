import 'package:employee_ni_service/features/home/data/model/response_home_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';

class TotalVisitRow extends StatelessWidget {
  final ResponseHomeDetails? homeDetailsValue;
  const TotalVisitRow(this.homeDetailsValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(
          'Total Visits: ${homeDetailsValue?.totalComplaints}',
          style: const TextStyle(
            color: AppPallete.label3Color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
