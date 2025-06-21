import 'package:employee_ni_service/core/common/widgets/custom_date_picker.dart';
import 'package:employee_ni_service/core/common/widgets/custom_form_builder_text_field.dart';
import 'package:employee_ni_service/core/common/widgets/custom_radio_button.dart';
import 'package:employee_ni_service/core/utils/machine_options.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateEmpForm extends StatefulWidget {
  final String? selectedGender;
  final String? selectedRole;
  final bool showGenderError;
  final bool showRoleError;
  final ValueChanged<String?> onGenderChanged;
  final ValueChanged<String?> onRoleChanged;
  const CreateEmpForm({
    super.key,
    required this.selectedGender,
    required this.selectedRole,
    required this.showGenderError,
    required this.showRoleError,
    required this.onGenderChanged,
    required this.onRoleChanged,
  });

  @override
  State<CreateEmpForm> createState() => _CreateEmpFormState();
}

class _CreateEmpFormState extends State<CreateEmpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CustomFormBuilderTextField(
          name: 'First Name',
          label: 'First Name',
          hintText: 'Enter your First Name',
          keyboardType: TextInputType.text,
          validators: [
            FormBuilderValidators.required(errorText: 'First Name is required')
          ],
        ),
        CustomFormBuilderTextField(
          name: 'Last Name',
          label: 'Last Name',
          hintText: 'Enter your Last Name',
          keyboardType: TextInputType.text,
          validators: [
            FormBuilderValidators.required(errorText: 'Last Name is required'),
          ],
        ),
        CustomFormBuilderTextField(
          name: 'Email',
          label: 'Email',
          hintText: 'Enter your Email Address',
          keyboardType: TextInputType.emailAddress,
          validators: [
            FormBuilderValidators.required(errorText: 'Email is required'),
            FormBuilderValidators.email(),
          ],
        ),
        CustomFormBuilderTextField(
          name: 'Mobile Number',
          label: 'Mobile Number',
          hintText: 'Enter your Mobile Number',
          keyboardType: TextInputType.number,
          maxLength: 10,
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
        CustomDatePicker(
          name: 'Date of Birth',
          label: 'DOB',
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          prefixIcon: Icons.calendar_today,
          validators: [
            FormBuilderValidators.required(
                errorText: 'Date of Birth is required')
          ],
        ),
        const SizedBox(height: 1),
        CustomRadioGroup<String>(
          label: 'Gender',
          options: genders,
          value: widget.selectedGender,
          onChanged: widget.onGenderChanged,
          errorText: widget.showGenderError ? "Please select gender" : null,
        ),
        const SizedBox(height: 16),
        CustomRadioGroup<String>(
          label: 'Role',
          options: roles,
          value: widget.selectedRole,
          onChanged: widget.onRoleChanged,
          errorText: widget.showRoleError ? 'Please select role' : null,
        ),
      ],
    );
  }
}
