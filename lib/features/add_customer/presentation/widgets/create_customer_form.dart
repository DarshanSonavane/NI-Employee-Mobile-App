import 'package:employee_ni_service/core/common/widgets/custom_date_picker.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/features/add_customer/presentation/widgets/state_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateCustomerForm extends StatefulWidget {
  final String? selectedState;
  final ValueChanged<String?> onStateChanged;
  const CreateCustomerForm({
    super.key,
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
            FormBuilderValidators.required(
                errorText: "Please enter Customer Code"),
          ],
        ),
        CustomFormBuilderTextField(
          name: 'Customer Name',
          label: 'Customer Name',
          hintText: 'Enter your Customer Name',
          keyboardType: TextInputType.text,
          validators: [
            FormBuilderValidators.required(
                errorText: "Please enter Customer Name"),
          ],
        ),
        CustomFormBuilderTextField(
          name: 'City',
          label: 'City',
          hintText: 'Enter your City',
          keyboardType: TextInputType.text,
          validators: [
            FormBuilderValidators.required(errorText: "Please enter City"),
          ],
        ),
        StateDropdownWidget(
          selectedState: widget.selectedState,
          onStateChanged: widget.onStateChanged,
        ),
        CustomFormBuilderTextField(
          name: 'Email',
          label: 'Email',
          hintText: 'Enter your Email Address',
          keyboardType: TextInputType.emailAddress,
          validators: [
            FormBuilderValidators.email(
                errorText: "Please enter a valid email address"),
          ],
        ),
        CustomFormBuilderTextField(
          name: 'Mobile Number',
          label: 'Mobile Number',
          hintText: 'Enter your Mobile Number',
          maxLength: 10,
          keyboardType: TextInputType.number,
          validators: [
            FormBuilderValidators.required(
                errorText: 'Mobile Number is required'),
            FormBuilderValidators.phoneNumber(
              errorText: 'Please enter a valid phone number',
            ),
            FormBuilderValidators.equalLength(
              10,
              errorText: 'Mobile number must be exactly 10 digits',
            ),
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
          validators: [
            FormBuilderValidators.required(errorText: "Please select a date")
          ],
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
