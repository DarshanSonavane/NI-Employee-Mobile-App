import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/features/add_employee/presentation/pages/add_employee.dart';
import 'package:employee_ni_service/features/add_notification.dart/presentation/pages/add_notification.dart';
import 'package:employee_ni_service/features/notification_profile/presentation/pages/notifications_list.dart';
import 'package:employee_ni_service/features/auth/presentation/pages/signin.dart';
import 'package:employee_ni_service/features/add_customer/presentation/pages/add_customer.dart';
import 'package:employee_ni_service/features/customer_profile/presentation/pages/customer_profile_page.dart';
import 'package:employee_ni_service/features/dashboard/widgets/more_option_menu.dart';
import 'package:employee_ni_service/features/employee_profile/presentation/pages/employee_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_theme/app_pallete.dart';
import '../../database/hive_storage_service.dart';
import '../../../service_locator_dependecies.dart';
import '../../../features/dashboard/provider/dashboard_state.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonVisible;
  final bool? isMoreButtonVisible;
  final bool? isFromMoreIcon;
  final String? navigateTo;
  const AppBarWidget({
    super.key,
    required this.title,
    this.isBackButtonVisible = false,
    this.isMoreButtonVisible = true,
    this.isFromMoreIcon = false,
    this.navigateTo,
  });

  void handleMenuOption(String option, BuildContext context) {
    switch (option) {
      case "customer":
        Navigator.push(context, CustomerProfilePage.route());
        break;
      case "employee":
        Navigator.push(context, EmployeeProfilePage.route());
        break;
      case "notification":
        Navigator.push(context, NotificationsList.route());
        break;
      case "addEmployee":
        Navigator.push(context, AddEmployee.route());
        break;
      case "addCustomer":
        Navigator.push(context, AddCustomer.route());
        break;
      case "addNotification":
        Navigator.push(context, AddNotification.route());
        break;
      case "logout":
        logout(context);
      default:
        debugPrint("Unknow Option: $option");
    }
  }

  Widget buildAppBarAction({
    required bool? isMoreButtonVisible,
    required bool? isFromMoreIcon,
    required void Function(String option) onSelected,
    BuildContext? context,
    String? option,
  }) {
    if (isMoreButtonVisible == true) {
      return MoreOptionMenu(onSelected: onSelected);
    } else if (isFromMoreIcon == true) {
      return GestureDetector(
        onTap: () {
          if (context != null && navigateTo != null) {
            handleMenuOption(navigateTo ?? "", context);
          }
        },
        child: const CircleAvatar(
          backgroundColor: AppPallete.gradientColor,
          radius: 16,
          child: Icon(
            Icons.add,
            size: 20,
            color: AppPallete.backgroundColor,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  void logout(BuildContext context) async {
    await sl<HiveStorageService>().clearUser();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        SigninScreen.route(),
        (route) => false,
      );
      context.read<DashboardState>().resetState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isBackButtonVisible
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppPallete.gradientColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          title,
          key: ValueKey<String>(title),
          style: const TextStyle(
            color: AppPallete.label3Color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
          child: fetchUserRole() != "0"
              ? IconButton(
                  icon: const Icon(
                    Icons.logout,
                    size: 28,
                    color: AppPallete.gradientColor,
                  ),
                  onPressed: () => logout(context),
                )
              : buildAppBarAction(
                  isMoreButtonVisible: isMoreButtonVisible,
                  isFromMoreIcon: isFromMoreIcon,
                  onSelected: (option) => handleMenuOption(option, context),
                  context: context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
