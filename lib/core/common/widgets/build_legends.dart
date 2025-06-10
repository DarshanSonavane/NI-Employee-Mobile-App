import 'package:flutter/material.dart';

import '../../app_theme/app_pallete.dart';

class BuildLegends extends StatelessWidget {
  final String status;
  final Color statusColor;
  const BuildLegends(this.status, this.statusColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: setBackgroundColor(status),
        borderRadius: BorderRadius.circular(4), // Rounded legend color box
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
        child: Text(
          status,
          style: TextStyle(
            fontSize: 15,
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
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
