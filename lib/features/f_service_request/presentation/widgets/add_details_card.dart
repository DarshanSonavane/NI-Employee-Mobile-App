import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/quantity_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/total_amount_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/row_quantity.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/switch_chargable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/machine_options.dart';
import '../../../calibration/presentation/widgets/machine_dropdown.dart';

class AddDetailsCard extends StatefulWidget {
  final Function(Key) onDelete;
  final Key cardKey;
  final bool isLastCard;
  const AddDetailsCard({
    super.key,
    required this.onDelete,
    required this.cardKey,
    required this.isLastCard,
  });

  @override
  State<AddDetailsCard> createState() => _AddDetailsCardState();
}

class _AddDetailsCardState extends State<AddDetailsCard> {
  bool isChargable = false;
  double rate = 25.0;
  String? selectedMachine;
  final rateController = TextEditingController();
  late double totalAmount = 0.0;
  late TotalAmountProvider? totalAmountProvider;

  @override
  void initState() {
    super.initState();
    totalAmountProvider =
        Provider.of<TotalAmountProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      totalAmountProvider?.updateCardAmount(widget.cardKey, totalAmount);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final quantityProvider = Provider.of<QuantityProvider>(context);
    totalAmount = quantityProvider.quantity * rate;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final totalAmountProvider =
          Provider.of<TotalAmountProvider>(context, listen: false);
      totalAmountProvider.updateCardAmount(widget.cardKey, totalAmount);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              CustomTextFormField(
                controller: rateController,
                labelText: Constants.rate,
                textStyle: const TextStyle(
                    color: AppPallete.label3Color, fontSize: 20),
                labelStyle: const TextStyle(color: AppPallete.label3Color),
                fillColor: AppPallete.backgroundClosed,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                editableText: false,
                initialValue: rate.toString(),
              ),
              const SizedBox(height: 10),
              setTextNormal(
                  '${Constants.eachItemAmount}${totalAmount.toStringAsFixed(2)}',
                  1),
              if (widget.isLastCard)
                Center(
                  child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => widget.onDelete(widget.cardKey)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
