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
          color: AppPallete.deepNavy,
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
                        Text(
                          '${employee.firstName} ${employee.lastName}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppPallete.backgroundColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          employee.employeeCode,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppPallete.backgroundInProcess,
                          ),
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

// import 'package:employee_ni_service/features/profile/domain/entities/entity_employee_profile.dart';
// import 'package:employee_ni_service/features/profile/presentation/widget/build_profile_column.dart';
// import 'package:flutter/material.dart';

// import '../../../../core/app_theme/app_pallete.dart';

// class ProfileCard extends StatelessWidget {
//   final List<EmployeeDetailsData> empData;
//   const ProfileCard({super.key, required this.empData});

//   @override
//   Widget build(BuildContext context) {
//     final employee = empData.first;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return SizedBox(
//       height: screenHeight * 0.8,
//       child: Card(
//         elevation: 4,
//         color: AppPallete.backgroundColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         margin: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ListView(
//             shrinkWrap: true,
//             children: [
//               BuildProfileColumn(
//                   labelName: 'Name',
//                   labelValue: '${employee.firstName} ${employee.lastName}'),
//               BuildProfileColumn(
//                   labelName: 'Email', labelValue: employee.email),
//               BuildProfileColumn(
//                   labelName: 'Phone', labelValue: employee.phone),
//               BuildProfileColumn(
//                   labelName: 'Gender',
//                   labelValue: employee.gender == "1" ? "Male" : "Female"),
//               BuildProfileColumn(
//                   labelName: 'Date of Birth', labelValue: employee.dob),
//               BuildProfileColumn(
//                   labelName: 'Employee Code',
//                   labelValue: employee.employeeCode),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
