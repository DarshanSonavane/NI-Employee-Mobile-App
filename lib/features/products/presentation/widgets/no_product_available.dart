import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class NoProductAvailable extends StatelessWidget {
  const NoProductAvailable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        Constants.noProductAvailable,
        style: TextStyle(fontSize: 16, color: AppPallete.deepNavy),
      ),
    );
  }
}
