import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_theme/app_pallete.dart';
import '../provider/dashboard_state.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardState>(
      builder: (context, dashboardState, child) {
        return FloatingActionButton(
          splashColor: AppPallete.errorColor,
          onPressed: () {
            dashboardState.selectFab(context);
          },
          backgroundColor: dashboardState.isFabSelected
              ? AppPallete.bottomNavigationButton
              : AppPallete.label2Color,
          child: Icon(Icons.home_outlined,
              size: dashboardState.isFabSelected ? 40 : 30),
        );
      },
    );
  }
}
