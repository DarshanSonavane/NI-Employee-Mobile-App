import 'package:employee_ni_service/features/complaint/domain/entities/entity_response_employee_details/employee_data.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/constants/constants.dart';

typedef SubmitCallback = void Function(String? selectedEmployee);

void showEmployeeDialog(
  BuildContext context,
  List<EmployeeData> employees,
  SubmitCallback onSubmitCallback,
  VoidCallback onClose,
) {
  final formKey = GlobalKey<FormState>();

  String? selectedEmployeeId;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppPallete.backgroundColor,
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                Constants.selectEmployee,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.gradientColor),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: Constants.selectEmployeeLabel,
                  labelStyle: TextStyle(color: AppPallete.label3Color),
                  filled: true,
                  fillColor: AppPallete.backgroundClosed,
                  border: UnderlineInputBorder(),
                ),
                style: const TextStyle(
                  color: AppPallete.label3Color,
                  fontSize: 20,
                ),
                value: selectedEmployeeId,
                items: employees
                    .map((employee) => DropdownMenuItem<String>(
                          value: employee.sId,
                          child: Text(
                            '${employee.firstName} ${employee.lastName}',
                            style:
                                const TextStyle(color: AppPallete.label3Color),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedEmployeeId = value;
                },
                dropdownColor: AppPallete.backgroundClosed,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppPallete.label3Color,
                ),
                validator: (value) =>
                    value == null ? Constants.selectEmployeeError : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
        actions: [
          AuthGradientButton(
            buttonText: Constants.submit,
            startColor: AppPallete.buttonColor,
            endColor: AppPallete.gradientColor,
            width: MediaQuery.of(context).size.width > 600 ? 200 : 100,
            height: 55,
            fontSize: 12,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onSubmitCallback(selectedEmployeeId);
                Navigator.pop(context);
              }
            },
          ),
          const SizedBox(width: 5),
          AuthGradientButton(
            buttonText: Constants.close,
            startColor: AppPallete.label3Color,
            endColor: AppPallete.label3Color,
            width: MediaQuery.of(context).size.width > 600 ? 200 : 100,
            height: 55,
            fontSize: 12,
            onPressed: () {
              Navigator.pop(context);
              onClose();
            },
          ),
        ],
      );
    },
  );
}
