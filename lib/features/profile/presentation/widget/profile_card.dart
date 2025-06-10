import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import 'build_profile_row.dart';
import 'package:employee_ni_service/features/profile/domain/entities/entity_employee_profile.dart';

class ProfileCard extends StatelessWidget {
  final List<EmployeeDetailsData> empData;
  const ProfileCard({super.key, required this.empData});

  @override
  Widget build(BuildContext context) {
    final employee = empData.first;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        height: screenHeight * 0.8,
        width: double.infinity,
        child: Card(
          elevation: 8,
          color: AppPallete.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomGlolbalText(
                          text: '${employee.firstName} ${employee.lastName}',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppPallete.deepNavy,
                        ),
                        const SizedBox(height: 4),
                        CustomGlolbalText(
                          text: employee.employeeCode,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppPallete.deepNavy,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Profile Details
                Expanded(
                  child: ListView(
                    children: [
                      BuildProfileRow(
                        labelName: 'Email',
                        labelValue: employee.email,
                        icon: Icons.email_outlined,
                      ),
                      BuildProfileRow(
                        labelName: 'Phone',
                        labelValue: employee.phone,
                        icon: Icons.phone_outlined,
                      ),
                      BuildProfileRow(
                        labelName: 'Gender',
                        labelValue: employee.gender == "1" ? "Male" : "Female",
                        icon: Icons.person_outline,
                      ),
                      BuildProfileRow(
                        labelName: 'Date of Birth',
                        labelValue: employee.dob,
                        icon: Icons.cake_outlined,
                      ),
                      BuildProfileRow(
                        labelName: 'Employee Code',
                        labelValue: employee.employeeCode,
                        icon: Icons.badge_outlined,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
