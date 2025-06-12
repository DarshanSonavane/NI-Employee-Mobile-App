import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/features/dashboard/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class EmployeeProfilePage extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const EmployeeProfilePage());
  }

  const EmployeeProfilePage({super.key});

  @override
  State<EmployeeProfilePage> createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
          title: "Employee Profile",
          isBackButtonVisible: true,
          isFromMoreIcon: true,
          isMoreButtonVisible: false,
          navigateTo: "addEmployee"),
      body: Container(),
    );
  }
}
