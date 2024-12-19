import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/row_quantity.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/switch_chargable.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/machine_options.dart';
import '../../../calibration/presentation/widgets/machine_dropdown.dart';

class AddDetailsCard extends StatefulWidget {
  final Function(Key) onDelete;

  const AddDetailsCard({super.key, required this.onDelete});

  @override
  State<AddDetailsCard> createState() => _AddDetailsCardState();
}

class _AddDetailsCardState extends State<AddDetailsCard> {
  int quantity = 0;
  bool isChargable = false;
  double rate = 0.0;
  String? selectedMachine;
  final rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double amount = quantity * rate;
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppPallete.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppPallete.borderColor, width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 15),
              const RowQuantity(),
              const SwitchChargable(),
              const SizedBox(height: 10),
              const CustomTextFormField(
                labelText: Constants.rate,
                textStyle:
                    TextStyle(color: AppPallete.label3Color, fontSize: 20),
                labelStyle: TextStyle(color: AppPallete.label3Color),
                fillColor: AppPallete.backgroundClosed,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                editableText: false,
                initialValue: '24',
              ),
              const SizedBox(height: 10),
              setTextNormal('Amount: \$${amount.toStringAsFixed(2)}', 1),
              Center(
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => widget.onDelete(widget.key!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
