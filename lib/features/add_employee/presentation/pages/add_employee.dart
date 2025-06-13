import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/common/widgets/custom_date_picker.dart';
import 'package:employee_ni_service/core/common/widgets/custom_drop_down.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/core/constants/constants.dart';
import 'package:employee_ni_service/core/utils/app_transition.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:employee_ni_service/core/common/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  static Route route() {
    return createSlideTransitionRoute(const AddEmployee());
  }

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final employeeFormKey = GlobalKey<FormBuilderState>();
  String? selectedState;

  void onStateSelected(String? value) {
    setState(() {
      selectedState = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.screenBackground,
      appBar: const AppBarWidget(
        title: "Add Employee",
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
                key: employeeFormKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 10,
                      children: [
                        CustomFormBuilderTextField(
                          name: 'First Name',
                          label: 'First Name',
                          hintText: 'Enter your First Name',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                        ),
                        CustomFormBuilderTextField(
                          name: 'Last Name',
                          label: 'Last Name',
                          hintText: 'Enter your Last Name',
                          keyboardType: TextInputType.text,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
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
                        CustomDatePicker(
                          name: 'Date of Birth',
                          label: 'DOB',
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2050),
                          prefixIcon: Icons.calendar_today,
                          validators: [FormBuilderValidators.required()],
                        ),
                        CustomDropdown<String>(
                          value: selectedState,
                          hintText: "Gender",
                          items: gender
                              .map((state) => DropdownMenuItem<String>(
                                    value: state,
                                    child: CustomGlolbalText(
                                      text: state,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppPallete.label3Color,
                                    ),
                                  ))
                              .toList(),
                          onChanged: onStateSelected,
                          borderColor: AppPallete.gradientColor,
                          iconColor: AppPallete.deepNavy,
                          textColor: AppPallete.label2Color,
                          dropdownColor: AppPallete.backgroundColor,
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
                buttonText: Constants.addEmployee,
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
