import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../data/model/response_home_details.dart';
import 'total_visit_row.dart';

class BuildHomeDetailsCard extends StatelessWidget {
  final ResponseHomeDetails? homeDetailsValue;
  const BuildHomeDetailsCard(this.homeDetailsValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TotalVisitRow(homeDetailsValue)),
    );
  }
}
