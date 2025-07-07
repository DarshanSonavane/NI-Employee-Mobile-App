import 'package:flutter/material.dart';
import '../../app_theme/app_pallete.dart';
import 'custom_drop_down.dart';
import 'custom_global_text.dart';
import '../../../features/complaint/data/models/model_fetch_employee/response_employee_model.dart';

class EmployeeSelectionSection extends StatelessWidget {
  final String? selectedEmployee;
  final ResponseEmployeeModel? employeeModel;
  final Function(String?) onEmployeeSelected;
  final bool? isHeaderVisible;

  const EmployeeSelectionSection(
      {super.key,
      required this.selectedEmployee,
      required this.employeeModel,
      required this.onEmployeeSelected,
      this.isHeaderVisible = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHeaderVisible == true
            ? const CustomGlolbalText(
                text: "Select Employee",
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppPallete.label3Color,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 16),
        CustomDropdown<String>(
          value: selectedEmployee,
          hintText: "Select Employee",
          items: employeeModel?.employeeData
                  .map((emp) => DropdownMenuItem<String>(
                        value: emp.sId,
                        child: CustomGlolbalText(
                          text: "${emp.firstName} ${emp.lastName}",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppPallete.deepNavy,
                        ),
                      ))
                  .toList() ??
              [],
          onChanged: onEmployeeSelected,
          borderColor: AppPallete.gradientColor,
          iconColor: AppPallete.deepNavy,
          textColor: AppPallete.label3Color,
          dropdownColor: AppPallete.backgroundColor,
        ),
      ],
    );
  }
}
