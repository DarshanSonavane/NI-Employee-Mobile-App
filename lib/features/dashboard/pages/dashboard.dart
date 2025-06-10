import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import '../../../core/utils/app_transition.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/bottom_nav_screens.dart';
import '../provider/dashboard_state.dart';
import '../widgets/custom_floating_action_button.dart';

class DashboardScreen extends StatelessWidget {
  static Route route() {
    return createSlideTransitionRoute(const DashboardScreen());
  }

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardState>(
      builder: (context, dashboardState, child) {
        return Scaffold(
          backgroundColor: AppPallete.screenBackground,
          appBar: AppBarWidget(title: dashboardState.currentTitle),
          body: const BottomNavScreens(),
          floatingActionButton: const CustomFloatingActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
