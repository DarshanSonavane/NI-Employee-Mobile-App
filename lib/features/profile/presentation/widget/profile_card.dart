import 'package:employee_ni_service/features/profile/domain/entities/entity_employee_profile.dart';
import 'package:employee_ni_service/features/profile/presentation/widget/build_profile_column.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';

class ProfileCard extends StatelessWidget {
  final List<EmployeeDetailsData> empData;
  const ProfileCard({super.key, required this.empData});

  @override
  Widget build(BuildContext context) {
    final employee = empData.first;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.8,
      child: Card(
        elevation: 4,
        color: AppPallete.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              BuildProfileColumn(
                  labelName: 'Name',
                  labelValue: '${employee.firstName} ${employee.lastName}'),
              BuildProfileColumn(
                  labelName: 'Email', labelValue: employee.email),
              BuildProfileColumn(
                  labelName: 'Phone', labelValue: employee.phone),
              BuildProfileColumn(
                  labelName: 'Gender',
                  labelValue: employee.gender == "1" ? "Male" : "Female"),
              BuildProfileColumn(
                  labelName: 'Date of Birth', labelValue: employee.dob),
              BuildProfileColumn(
                  labelName: 'Employee Code',
                  labelValue: employee.employeeCode),
            ],
          ),
        ),
      ),
    );
  }
}
