import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/features/customer_profile/presentation/pages/customer_profile_page.dart';
import 'package:employee_ni_service/features/employee_profile/presentation/pages/employee_profile_page.dart';
import 'package:employee_ni_service/features/feature_profile/presentation/widgets/feature_card.dart';
import 'package:flutter/material.dart';

class FeatureProfile extends StatefulWidget {
  const FeatureProfile({super.key});

  @override
  State<FeatureProfile> createState() => _FeatureProfileState();
}

class _FeatureProfileState extends State<FeatureProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Column(
        children: [
          FeatureCard(
            label: 'Customer Profile',
            icon: Icons.person_outline,
            onTap: () =>
                Navigator.of(context).push(CustomerProfilePage.route()),
          ),
          FeatureCard(
            label: 'Employee Profile',
            icon: Icons.badge_outlined,
            onTap: () =>
                Navigator.of(context).push(EmployeeProfilePage.route()),
          ),
        ],
      ),
    );
  }
}
