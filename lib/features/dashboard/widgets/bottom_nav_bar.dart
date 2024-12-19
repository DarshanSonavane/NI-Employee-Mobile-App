import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dashboard_state.dart';
import 'custom_bottom_app_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardState>(
      builder: (context, dashboardState, child) {
        return CustomBottomAppBar(
          selectedIndex: dashboardState.selectedIndex,
          onItemTapped: (index) => dashboardState.updateIndex(index, context),
        );
      },
    );
  }
}
