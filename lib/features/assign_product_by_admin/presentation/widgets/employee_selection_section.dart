import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/custom_drop_down.dart';
import '../../../../core/common/widgets/custom_global_text.dart';
import '../../../complaint/data/models/model_fetch_employee/response_employee_model.dart';

class EmployeeSelectionSection extends StatelessWidget {
  final String? selectedEmployee;
  final ResponseEmployeeModel? employeeModel;
  final Function(String?) onEmployeeSelected;

  const EmployeeSelectionSection({
    super.key,
    required this.selectedEmployee,
    required this.employeeModel,
    required this.onEmployeeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomGlolbalText(
          text: "Select Employee",
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: AppPallete.label3Color,
        ),
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
