import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../calibration/calibration_screen.dart';
import '../../complaint/complaint_screen.dart';
import '../../home/home_screen.dart';
import '../../profile/profile_screen.dart';
import '../../service_request/service_request.dart';
import '../provider/dashboard_state.dart';

class BottomNavScreens extends StatelessWidget {
  const BottomNavScreens({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardState>(
      builder: (context, dashboardState, child) {
        return IndexedStack(
          index: dashboardState.selectedIndex,
          children: const [
            ComplaintScreen(),
            ServiceRequestScreen(),
            CalibrationScreen(),
            ProfileScreen(),
            HomeScreen(),
          ],
        );
      },
    );
  }
}
