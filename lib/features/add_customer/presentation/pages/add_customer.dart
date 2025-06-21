import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/common/widgets/custom_date_picker.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/core/common/widgets/custom_radio_button.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  static Route route() {
    return createSlideTransitionRoute(const AddCustomer());
  }

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final customerFormKey = GlobalKey<FormBuilderState>();
  String? selectedState;
  bool showGenderError = false;
  String? selectedGender;

  void onStateSelected(String? value) {
    setState(() {
      selectedState = value;
    });
  }

  void onGenderChanged(String? v) => setState(() {
        selectedGender = v;
        showGenderError = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Add Customer",
        isBackButtonVisible: true,
        isMoreButtonVisible: false,
        isFromMoreIcon: false,
      ),
      body: SafeArea(
        child: Column(
          spacing: 15,
          children: [
            Expanded(
              child: FormBuilder(
                key: customerFormKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 10,
                      children: [
                        CustomFormBuilderTextField(
                          name: 'Customer Code',
                          label: 'Customer Code',
                          hintText: 'Enter your Customer Code',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomFormBuilderTextField(
                          name: 'Customer Name',
                          label: 'Customer Name',
                          hintText: 'Enter your Customer Name',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomFormBuilderTextField(
                          name: 'City',
                          label: 'City',
                          hintText: 'Enter your City',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomRadioGroup<String>(
                          label: 'Gender',
                          options: genders,
                          value: selectedGender,
                          onChanged: onGenderChanged,
                          errorText:
                              showGenderError ? 'Please select gender' : null,
                        ),
                        CustomFormBuilderTextField(
                          name: 'Email',
                          label: 'Email',
                          hintText: 'Enter your Email Address',
                          keyboardType: TextInputType.emailAddress,
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ],
                        ),
                        CustomFormBuilderTextField(
                          name: 'Mobile Number',
                          label: 'Mobile Number',
                          hintText: 'Enter your Mobile Number',
                          keyboardType: TextInputType.number,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomFormBuilderTextField(
                          name: 'GST No.',
                          label: 'GST No.',
                          hintText: 'Enter your GST No.',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomDatePicker(
                          name: 'Amc Date',
                          label: 'Amc Date',
                          firstDate: DateTime(2025),
                          lastDate: DateTime(2050),
                          prefixIcon: Icons.calendar_today,
                          validators: [FormBuilderValidators.required()],
                        ),
                        CustomFormBuilderTextField(
                          name: 'Petrol Machine No.',
                          label: 'Petrol Machine No.',
                          hintText: 'Enter your Petrol Machine No.',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomFormBuilderTextField(
                          name: 'Diesel Machine No.',
                          label: 'Diesel Machine No.',
                          hintText: 'Enter your Diesel Machine No.',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomFormBuilderTextField(
                          name: 'Combo Machine No.',
                          label: 'Combo Machine No.',
                          hintText: 'Enter your Combo Machine No.',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AuthGradientButton(
                buttonText: Constants.addCustomer,
                startColor: AppPallete.buttonColor,
                endColor: AppPallete.gradientColor,
                width: MediaQuery.of(context).size.width,
                height: 55,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
