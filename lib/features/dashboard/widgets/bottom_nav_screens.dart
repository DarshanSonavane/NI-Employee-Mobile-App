import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/features/feature_profile/presentation/pages/feature_profile.dart';
import 'package:employee_ni_service/features/products/presentation/pages/product_screen.dart';
import 'package:employee_ni_service/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../calibration/presentation/pages/calibration_screen.dart';
import '../../complaint/presentation/pages/complaint_screen.dart';
import '../../home/presentation/pages/home_screen.dart';
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
          children: [
            const ComplaintScreen(),
            const CalibrationScreen(),
            const ProductScreen(),
            fetchUserRole() == "0"
                ? const FeatureProfile()
                : const ProfileScreen(),
            HomeScreen(key: dashboardState.homeKey),
          ],
        );
      },
    );
  }
}
