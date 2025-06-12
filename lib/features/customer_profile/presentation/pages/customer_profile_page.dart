import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/features/dashboard/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class CustomerProfilePage extends StatefulWidget {
  static Route route() {
    return createSlideTransitionRoute(const CustomerProfilePage());
  }

  const CustomerProfilePage({super.key});

  @override
  State<CustomerProfilePage> createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Customer Profile",
        isBackButtonVisible: true,
        isFromMoreIcon: true,
        isMoreButtonVisible: false,
        navigateTo: "addCustomer",
      ),
      body: Container(),
    );
  }
}
