import 'package:employee_ni_service/features/calibration/data/model/model_add_machine/request_add_machine_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/constants/constants.dart';

class AddMachineDialog extends StatefulWidget {
  final Function(RequestAddMachineModel) onAddMachineTap;
  const AddMachineDialog({super.key, required this.onAddMachineTap});

  @override
  State<AddMachineDialog> createState() => _AddMachineDialogState();
}

class _AddMachineDialogState extends State<AddMachineDialog> {
  final List<Map<String, dynamic>> machineOptions = [
    {"id": 1, "label": "NPM MGA1"},
    {"id": 2, "label": "NPM MGA2"},
    {"id": 3, "label": "NPM SMIIIB"},
    {"id": 4, "label": "NUVO 10"},
    {"id": 5, "label": "NUVO 20"},
  ];
  String? selectedMachine;
  final TextEditingController machineNumberController = TextEditingController();
  final TextEditingController customerCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: AppPallete.backgroundColor,
      title: const Text(Constants.addMachineDetails),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: '${Constants.selectMachine}*',
                  labelStyle: TextStyle(color: AppPallete.label3Color),
                  filled: true,
                  fillColor: AppPallete.backgroundClosed,
                  border: UnderlineInputBorder(),
                ),
                style: const TextStyle(
                  color: AppPallete.label3Color,
                  fontSize: 20,
                ),
                value: selectedMachine,
                items: machineOptions
                    .map((option) => DropdownMenuItem<String>(
                          value: option['label'],
                          child: Text(
                            option['label'],
                            style:
                                const TextStyle(color: AppPallete.label3Color),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMachine = value;
                  });
                },
                dropdownColor: AppPallete.backgroundClosed,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppPallete.label3Color,
                ),
                validator: (value) =>
                    value == null ? Constants.machineDropDown : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: machineNumberController,
                  style: const TextStyle(
                      color: AppPallete.label3Color, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: Constants.machineNumber,
                    labelStyle: TextStyle(color: AppPallete.label3Color),
                    filled: true,
                    fillColor: AppPallete.backgroundClosed,
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? Constants.enterMachineNumber
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: customerCodeController,
                  style: const TextStyle(
                      color: AppPallete.label3Color, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: '${Constants.customerCode}*',
                    labelStyle: TextStyle(color: AppPallete.label3Color),
                    filled: true,
                    fillColor: AppPallete.backgroundClosed,
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? Constants.enterCustomerCode
                      : null,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        AuthGradientButton(
            buttonText: Constants.submit,
            startColor: AppPallete.buttonColor,
            endColor: AppPallete.gradientColor,
            width: screenWidth > 600 ? 200 : 100,
            height: 55,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
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
        const SizedBox(width: 5),
        AuthGradientButton(
          buttonText: Constants.close,
          startColor: AppPallete.label3Color,
          endColor: AppPallete.label3Color,
          width: screenWidth > 600 ? 200 : 100,
          height: 55,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
