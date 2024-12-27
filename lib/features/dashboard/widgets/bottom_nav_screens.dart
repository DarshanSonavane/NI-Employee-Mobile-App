import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../calibration/presentation/pages/calibration_screen.dart';
import '../../complaint/presentation/pages/complaint_screen.dart';
import '../../home/presentation/pages/home_screen.dart';
import '../../profile/presentation/pages/profile_screen.dart';
import '../../f_service_request/presentation/pages/f_service_request.dart';
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
            CalibrationScreen(),
            FServiceRequest(
              complaintId: "",
            ),
            ProfileScreen(),
            HomeScreen(),
          ],
        );
      },
    );
  }
}
