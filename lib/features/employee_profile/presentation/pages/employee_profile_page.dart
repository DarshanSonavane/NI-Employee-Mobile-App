import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:employee_ni_service/features/employee_profile/presentation/widgets/employee_list_widget.dart';
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
  final List<Map<String, String>> dummyEmployee = [
    {
      'firstName': 'John',
      'lastName': 'Doe',
      'email': 'john.doe@example.com',
      'mobileNo': '9876543210',
      'date': '12/06/2025',
      'gender': 'Male',
    },
    {
      'firstName': 'Jane',
      'lastName': 'Smith',
      'email': 'jane.smith@example.com',
      'mobileNo': '9123456780',
      'date': '10/06/2025',
      'gender': 'Female',
    },
    {
      'firstName': 'Amit',
      'lastName': 'Sharma',
      'email': 'amit.sharma@example.com',
      'mobileNo': '9988776655',
      'date': '08/06/2025',
      'gender': 'Male',
    },
    {
      'firstName': 'Priya',
      'lastName': 'Verma',
      'email': 'priya.verma@example.com',
      'mobileNo': '9090909090',
      'date': '05/06/2025',
      'gender': 'Female',
    },
    {
      'firstName': 'Ali',
      'lastName': 'Khan',
      'email': 'ali.khan@example.com',
      'mobileNo': '9000012345',
      'date': '01/06/2025',
      'gender': 'Male',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Employee Profile",
        isBackButtonVisible: true,
        isFromMoreIcon: true,
        isMoreButtonVisible: false,
        navigateTo: "addEmployee",
      ),
      body: ListView.builder(
        itemCount: dummyEmployee.length,
        itemBuilder: (context, index) {
          final item = dummyEmployee[index];
          return EmployeeListWidget(item: item);
        },
      ),
    );
  }
}
