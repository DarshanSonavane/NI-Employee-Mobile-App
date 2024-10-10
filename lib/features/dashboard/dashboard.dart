import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/bottom_nav_screens.dart';
import 'provider/dashboard_state.dart';
import 'widgets/custom_floating_action_button.dart';

class DashboardScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => DashboardState(),
          child: const DashboardScreen(),
        ),
      );
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: AppBarWidget(title: Constants.appBarHome),
      body: BottomNavScreens(),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
