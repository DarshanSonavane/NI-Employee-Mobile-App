import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/total_amount_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/create_signature_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final detailsActionController = TextEditingController();
  double totalAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TotalAmountProvider(),
      child: Scaffold(
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
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
                      fillColor: AppPallete.backgroundClosed,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    CustomTextFormField(
                      labelText: Constants.contactPerson,
                      controller: contactPersonController,
                      textStyle: const TextStyle(
                          color: AppPallete.label3Color, fontSize: 20),
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
                      fillColor: AppPallete.backgroundClosed,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    CustomTextFormField(
                      labelText: Constants.designation,
                      controller: designationController,
                      textStyle: const TextStyle(
                          color: AppPallete.label3Color, fontSize: 20),
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
                      fillColor: AppPallete.backgroundClosed,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    CustomTextFormField(
                      labelText: Constants.engEmpCode,
                      controller: engEmpCodeController,
                      textStyle: const TextStyle(
                          color: AppPallete.label3Color, fontSize: 20),
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
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
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
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
                    CustomTextFormField(
                      labelText: Constants.remark,
                      controller: remarkController,
                      textStyle: const TextStyle(
                          color: AppPallete.label3Color, fontSize: 20),
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
                      fillColor: AppPallete.backgroundClosed,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    CustomTextFormField(
                      labelText: Constants.detailsOfAction,
                      controller: correctiveActionController,
                      textStyle: const TextStyle(
                          color: AppPallete.label3Color, fontSize: 20),
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
                      fillColor: AppPallete.backgroundClosed,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLines: 3,
                    ),
                    CustomTextFormField(
                      labelText: Constants.correctiveAction,
                      controller: detailsActionController,
                      textStyle: const TextStyle(
                          color: AppPallete.label3Color, fontSize: 20),
                      labelStyle:
                          const TextStyle(color: AppPallete.label3Color),
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
                    const SizedBox(height: 5),
                    const AddDetailsWidget(),
                    const SizedBox(height: 10),
                    Consumer<TotalAmountProvider>(
                      builder: (context, provider, child) {
                        double totalAmount = provider.getTotalAmount;
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: setTextNormal(
                                "Total Amount (Incl. GST) :- \u20B9${totalAmount.toStringAsFixed(2)}/-",
                                0.9),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AuthGradientButton(
                          buttonText: Constants.employeeSignature,
                          startColor: AppPallete.buttonColor,
                          endColor: AppPallete.gradientColor,
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 55,
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return CreateSignatureDialog(
                                  onSignatureSubmitTap: (value) => {},
                                );
                              },
                            );
                          },
                        ),
                        AuthGradientButton(
                          buttonText: Constants.customerSignature,
                          startColor: AppPallete.buttonColor,
                          endColor: AppPallete.gradientColor,
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: 55,
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return CreateSignatureDialog(
                                  onSignatureSubmitTap: (value) =>
                                      {debugPrint(value)},
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    AuthGradientButton(
                      buttonText: Constants.submit,
                      startColor: AppPallete.buttonColor,
                      endColor: AppPallete.gradientColor,
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 55,
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return CreateSignatureDialog(
                              onSignatureSubmitTap: (value) =>
                                  {debugPrint(value)},
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
