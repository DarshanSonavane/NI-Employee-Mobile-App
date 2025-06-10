import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_cylinder_details/response_cylinder_details.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_update_cylinder/request_update_cylinder_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/show_snackbar.dart';

class ShowCylinderDetailsDialog extends StatefulWidget {
  final ResponseCylinderDetails responseCylinderDetails;
  final Function(RequestUpdateCylinderDetails) onCylinderDetailsTap;

  const ShowCylinderDetailsDialog(
    this.responseCylinderDetails, {
    super.key,
    required this.onCylinderDetailsTap,
  });

  @override
  State<ShowCylinderDetailsDialog> createState() =>
      _ShowCylinderDetailsDialogState();
}

class _ShowCylinderDetailsDialogState extends State<ShowCylinderDetailsDialog> {
  late TextEditingController coController;
  late TextEditingController co2Controller;
  late TextEditingController hcController;
  late TextEditingController o2Controller;
  late TextEditingController cylinderNumberController;
  late TextEditingController cylinderMakeController;
  late TextEditingController validityDateController;
  late String cylinderId;
  late String createdBy;

  @override
  void initState() {
    super.initState();
    final cylinderValue = widget.responseCylinderDetails.cylinderData![0];
    coController = TextEditingController(text: cylinderValue.cO);
    co2Controller = TextEditingController(text: cylinderValue.cO2);
    hcController = TextEditingController(text: cylinderValue.hC);
    o2Controller = TextEditingController(text: cylinderValue.o2);
    cylinderNumberController =
        TextEditingController(text: cylinderValue.cylinderNumber);
    cylinderMakeController =
        TextEditingController(text: cylinderValue.cylinderMake);
    validityDateController =
        TextEditingController(text: cylinderValue.validityDate);
    cylinderId = cylinderValue.sId!;
    createdBy = cylinderValue.createdBy!;
  }

  @override
  void dispose() {
    coController.dispose();
    co2Controller.dispose();
    hcController.dispose();
    o2Controller.dispose();
    cylinderNumberController.dispose();
    cylinderMakeController.dispose();
    validityDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: AppPallete.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Center(
        child: Text(
          Constants.cylinderDetails,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppPallete.gradientColor,
          ),
        ),
      ),
      content: Container(
        width: screenWidth > 600 ? screenWidth * 0.5 : screenWidth * 0.8,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(
                'CO Value*',
                coController,
                const TextInputType.numberWithOptions(),
              ),
              _buildTextField(
                'CO2 Value*',
                co2Controller,
                const TextInputType.numberWithOptions(),
              ),
              _buildTextField(
                'HC Value*',
                hcController,
                const TextInputType.numberWithOptions(),
              ),
              _buildTextField(
                'O2 Value*',
                o2Controller,
                const TextInputType.numberWithOptions(decimal: true),
              ),
              _buildTextField(
                'Cylinder Number*',
                cylinderNumberController,
                const TextInputType.numberWithOptions(decimal: true),
              ),
              _buildTextField(
                'Cylinder Make*',
                cylinderMakeController,
                TextInputType.text,
              ),
              _buildTextField(
                'Validity Date*',
                validityDateController,
                TextInputType.text,
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
                  if (coController.text.isEmpty ||
                      co2Controller.text.isEmpty ||
                      hcController.text.isEmpty ||
                      o2Controller.text.isEmpty ||
                      cylinderNumberController.text.isEmpty ||
                      cylinderMakeController.text.isEmpty ||
                      validityDateController.text.isEmpty) {
                    showSnackBar(context, "Please fill in all required fields",
                        backgroundColor: AppPallete.errorColor);
                    return;
                  }
                  Navigator.pop(context);
                  final requestUpdateCylinderDetails =
                      RequestUpdateCylinderDetails(
                    sId: cylinderId,
                    cO: coController.text,
                    cO2: co2Controller.text,
                    hC: hcController.text,
                    o2: o2Controller.text,
                    cylinderNumber: cylinderNumberController.text,
                    cylinderMake: cylinderMakeController.text,
                    validityDate: validityDateController.text,
                    createdBy: createdBy,
                  );
                  widget.onCylinderDetailsTap(requestUpdateCylinderDetails);
                },
              ),
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

  Widget _buildTextField(String label, TextEditingController controller,
      TextInputType textInputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        style: const TextStyle(color: AppPallete.label3Color, fontSize: 20),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: AppPallete.label3Color),
          filled: true,
          fillColor: AppPallete.backgroundClosed,
          border: const UnderlineInputBorder(),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
