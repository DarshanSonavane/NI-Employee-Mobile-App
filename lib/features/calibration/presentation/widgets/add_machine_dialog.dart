import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_add_machine/request_add_machine_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/machine_options.dart';
import '../../../../core/utils/show_snackbar.dart';
import 'machine_dropdown.dart';

class AddMachineDialog extends StatefulWidget {
  final Function(RequestAddMachineModel) onAddMachineTap;
  const AddMachineDialog({super.key, required this.onAddMachineTap});

  @override
  State<AddMachineDialog> createState() => _AddMachineDialogState();
}

class _AddMachineDialogState extends State<AddMachineDialog> {
  String? selectedMachine;
  final TextEditingController machineNumberController = TextEditingController();
  final TextEditingController customerCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: AppPallete.backgroundColor,
      title: const CustomGlolbalText(
        text: Constants.addMachineDetails,
        color: AppPallete.deepNavy,
        fontWeight: FontWeight.bold,
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GenericDropdown(
                dropDownType: Constants.machineDropDown,
                selectedValue: selectedMachine,
                onChanged: (value) {
                  setState(() {
                    selectedMachine = value;
                  });
                },
                options: machineOptions,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: Constants.machineNumber,
                controller: machineNumberController,
                textStyle: const TextStyle(
                    color: AppPallete.label3Color, fontSize: 16),
                labelStyle: const TextStyle(color: AppPallete.label3Color),
                fillColor: AppPallete.backgroundClosed,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: customerCodeController,
                labelText: '${Constants.customerCode}*',
                textStyle: const TextStyle(
                    color: AppPallete.label3Color, fontSize: 20),
                labelStyle: const TextStyle(color: AppPallete.label3Color),
                fillColor: AppPallete.backgroundClosed,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: AuthGradientButton(
                  buttonText: Constants.submit,
                  startColor: AppPallete.buttonColor,
                  endColor: AppPallete.gradientColor,
                  width: screenWidth > 600 ? 200 : 100,
                  height: 55,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (machineNumberController.text.isEmpty ||
                          customerCodeController.text.isEmpty) {
                        showSnackBar(
                            context, "Please fill in all required fields",
                            backgroundColor: AppPallete.errorColor);
                        return;
                      }

                      Navigator.pop(context);
                      RequestAddMachineModel requestAddMachineModel =
                          RequestAddMachineModel(
                        machineType: selectedMachine!,
                        machineNumber: machineNumberController.text.toString(),
                        customerCode: customerCodeController.text.toString(),
                      );
                      widget.onAddMachineTap(requestAddMachineModel);
                    }
                  }),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: AuthGradientButton(
                buttonText: Constants.close,
                startColor: AppPallete.label3Color,
                endColor: AppPallete.label3Color,
                width: screenWidth > 600 ? 200 : 100,
                height: 55,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
