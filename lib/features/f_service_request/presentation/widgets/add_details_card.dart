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
  final Function(double) onAmountChanged;
  const AddDetailsCard({
    super.key,
    required this.onDelete,
    required this.onAmountChanged,
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
  late TotalAmountProvider totalAmountProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    totalAmountProvider =
        Provider.of<TotalAmountProvider>(context, listen: false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      totalAmountProvider.removeCard(widget.key!);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuantityProvider(),
      child: Padding(
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
                  initialValue: '25',
                ),
                const SizedBox(height: 10),
                Consumer2<QuantityProvider, TotalAmountProvider>(
                  builder:
                      (context, quantityProvider, totalAmountProvider, child) {
                    double amount = quantityProvider.quantity * rate;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      totalAmountProvider.updateCardAmount(widget.key!, amount);
                    });
                    return setTextNormal(
                        'Amount: \u20B9${amount.toStringAsFixed(2)}', 1);
                  },
                ),
                Center(
                  child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          totalAmountProvider.removeCard(widget.key!);
                          widget.onDelete(widget.key!);
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
