import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../calibration/presentation/widgets/machine_dropdown.dart';
import '../widgets/add_details_widget.dart';

class FServiceRequest extends StatefulWidget {
  const FServiceRequest({super.key});

  @override
  State<FServiceRequest> createState() => _FServiceRequestState();
}

class _FServiceRequestState extends State<FServiceRequest> {
  final formKey = GlobalKey<FormState>();
  String? selectedMachine;
  String? natureOfComplaint;
  String? status;
  final customerCodeController = TextEditingController();
  final contactPersonController = TextEditingController();
  final designationController = TextEditingController();
  final engEmpCodeController = TextEditingController();
  final complaintTypeController = TextEditingController();
  final remarkController = TextEditingController();
  final correctiveActionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    labelText: Constants.customerCode,
                    controller: customerCodeController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CustomTextFormField(
                    labelText: Constants.contactPerson,
                    controller: contactPersonController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CustomTextFormField(
                    labelText: Constants.designation,
                    controller: designationController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  CustomTextFormField(
                    labelText: Constants.engEmpCode,
                    controller: engEmpCodeController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  GenericDropdown(
                    dropDownType: Constants.selectMachine,
                    selectedValue: selectedMachine,
                    onChanged: (value) {
                      setState(() {
                        selectedMachine = value;
                      });
                    },
                    options: machineOptions,
                  ),
                  CustomTextFormField(
                    labelText: Constants.complaintType,
                    controller: complaintTypeController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  GenericDropdown(
                    dropDownType: Constants.natureOfComplaint,
                    selectedValue: natureOfComplaint,
                    onChanged: (value) {
                      setState(() {
                        natureOfComplaint = value;
                      });
                    },
                    options: natureOfCallOptions,
                  ),
                  const AddDetailsWidget(),
                  CustomTextFormField(
                    labelText: Constants.remark,
                    controller: remarkController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: 3,
                  ),
                  CustomTextFormField(
                    labelText: Constants.correctiveAction,
                    controller: correctiveActionController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 20),
                    labelStyle: const TextStyle(color: AppPallete.label3Color),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: 3,
                  ),
                  GenericDropdown(
                    dropDownType: Constants.status,
                    selectedValue: status,
                    onChanged: (value) {
                      setState(() {
                        status = value;
                      });
                    },
                    options: statusOptions,
                  ),
                  const SizedBox(height: 10),
                  AuthGradientButton(
                    buttonText: Constants.submit,
                    startColor: AppPallete.buttonColor,
                    endColor: AppPallete.gradientColor,
                    width: 395,
                    height: 55,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
