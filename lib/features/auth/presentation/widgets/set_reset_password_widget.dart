import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SetResetPasswordWidget extends StatelessWidget {
  const SetResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey[300],
              endIndent: 10, // Space between the line and text
            ),
          ),
          const Text(
            Constants.setResetPasswordLabel,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppPallete.labelColor, // Match the text color
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: Colors.grey[300],
              indent: 10, // Space between the line and text
            ),
          ),
        ],
      ),
    );
  }
}
