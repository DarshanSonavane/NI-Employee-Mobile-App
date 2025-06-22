import 'package:employee_ni_service/core/common/widgets/custom_date_picker.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/core/common/widgets/custom_radio_button.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:employee_ni_service/features/add_customer/presentation/widgets/state_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateCustomerForm extends StatefulWidget {
  final String? selectedGender;
  final bool showGenderError;
  final ValueChanged<String?> onGenderChanged;
  final String? selectedState;
  final ValueChanged<String?> onStateChanged;
  const CreateCustomerForm({
    super.key,
    required this.selectedGender,
    required this.showGenderError,
    required this.onGenderChanged,
    required this.selectedState,
    required this.onStateChanged,
  });

  @override
  State<CreateCustomerForm> createState() => _CreateCustomerFormState();
}

class _CreateCustomerFormState extends State<CreateCustomerForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        StateDropdownWidget(
          selectedState: widget.selectedState,
          onStateChanged: widget.onStateChanged,
        ),
        CustomRadioGroup<String>(
          label: 'Gender',
          options: genders,
          value: widget.selectedGender,
          onChanged: widget.onGenderChanged,
          errorText: widget.showGenderError ? 'Please select gender' : null,
        ),
        CustomFormBuilderTextField(
          name: 'Email',
          label: 'Email',
          hintText: 'Enter your Email Address',
          keyboardType: TextInputType.emailAddress,
          validators: [
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
        const CustomFormBuilderTextField(
          name: 'GST No.',
          label: 'GST No.',
          hintText: 'Enter your GST No.',
          keyboardType: TextInputType.text,
        ),
        CustomDatePicker(
          name: 'Amc Date',
          label: 'Amc Date',
          firstDate: DateTime(2025),
          lastDate: DateTime(2050),
          prefixIcon: Icons.calendar_today,
          validators: [FormBuilderValidators.required()],
        ),
        const CustomFormBuilderTextField(
          name: 'Petrol Machine No.',
          label: 'Petrol Machine No.',
          hintText: 'Enter your Petrol Machine No.',
          keyboardType: TextInputType.text,
        ),
        const CustomFormBuilderTextField(
          name: 'Diesel Machine No.',
          label: 'Diesel Machine No.',
          hintText: 'Enter your Diesel Machine No.',
          keyboardType: TextInputType.text,
        ),
        const CustomFormBuilderTextField(
          name: 'Combo Machine No.',
          label: 'Combo Machine No.',
          hintText: 'Enter your Combo Machine No.',
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
