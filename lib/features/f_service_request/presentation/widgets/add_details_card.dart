import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/set_text_normal.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/quantity_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/provider/total_amount_provider.dart';
import 'package:employee_ni_service/features/f_service_request/presentation/widgets/row_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/widgets/custom_drop_down.dart';
import '../../../../core/common/widgets/custom_global_text.dart';
import '../../../../core/common/widgets/custom_text_field.dart';
import '../../../../core/constants/constants.dart';
import '../../../products/domain/entities/assigned_emp_product_list.dart';
import '../../domain/entities/request_create_fsr_entity.dart';
import 'switch_chargable.dart';

class AddDetailsCard extends StatefulWidget {
  final Function(Key) onDelete;
  final Function(ProductUsedEntity) onProductChanged;
  final Key cardKey;
  final bool isLastCard;
  final List<EmployeeInventoryEntity> inventoryList;
  const AddDetailsCard(
      {super.key,
      required this.onDelete,
      required this.onProductChanged,
      required this.cardKey,
      required this.isLastCard,
      required this.inventoryList});

  @override
  State<AddDetailsCard> createState() => _AddDetailsCardState();
}

class _AddDetailsCardState extends State<AddDetailsCard> {
  String isChargable = "N";
  String? selectedMachine;
  String? selectedProduct;
  int assignedQuantity = 0;
  double selectProductPrice = 0.0;
  final rateController = TextEditingController();
  double totalAmount = 0.0;
  late TotalAmountProvider totalAmountProvider;
  late QuantityProvider quantityProvider;

  @override
  void initState() {
    super.initState();
    totalAmountProvider =
        Provider.of<TotalAmountProvider>(context, listen: false);
    quantityProvider = Provider.of<QuantityProvider>(context, listen: false);
    quantityProvider.addListener(updateProductData);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      totalAmountProvider.updateCardAmount(widget.cardKey, totalAmount);
    });
  }

  @override
  void dispose() {
    quantityProvider.removeListener(updateProductData);
    rateController.dispose();
    super.dispose();
  }

  void updateProductData() {
    if (selectedProduct != null) {
      final product =
          widget.inventoryList.firstWhere((item) => item.id == selectedProduct);
      int selectedQuantity = quantityProvider.getQuantity;
      double amount = double.parse(rateController.text) * selectedQuantity;
      double gstAmount = amount * 0.18;
      double totalAmountInclGst = amount + gstAmount;

      setState(() {
        totalAmount = isChargable == "Y" ? amount : 0.0;
      });

      final productUsed = ProductUsedEntity(
          productName: product.product.productName,
          quantityUsed: selectedQuantity,
          rate: rateController.text,
          amount: isChargable == "Y" ? amount : 0.00,
          gstAmount: isChargable == "Y" ? totalAmountInclGst : 0.00,
          productId: product.product.id,
          productCode: product.product.productCode,
          chargable: isChargable);

      widget.onProductChanged(productUsed);
      totalAmountProvider.updateCardAmount(widget.cardKey, totalAmount);
    }
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
              CustomDropdown<String>(
                value: selectedProduct,
                hintText: "Choose Products",
                items: widget.inventoryList
                    .map((item) => DropdownMenuItem<String>(
                          value: item.id,
                          child: CustomGlolbalText(
                            text: item.product.productName,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppPallete.deepNavy,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedProduct = value;
                    final product = widget.inventoryList
                        .firstWhere((item) => item.id == value);
                    assignedQuantity = product.assignedQuantity;
                    selectProductPrice = product.product.price;
                    rateController.text = selectProductPrice.toString();
                  });
                  updateProductData();
                },
                borderColor: AppPallete.gradientColor,
                iconColor: AppPallete.deepNavy,
                textColor: AppPallete.label3Color,
                dropdownColor: AppPallete.backgroundColor,
              ),
              const SizedBox(height: 15),
              SwitchChargable(
                onChargableChanged: (value) {
                  setState(() {
                    isChargable = value ? "Y" : "N";
                    updateProductData();
                  });
                },
              ),
              RowQuantity(assignedQuantity: assignedQuantity),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: rateController,
                value: rateController.text,
                labelText: Constants.rate,
                textStyle: const TextStyle(
                    color: AppPallete.label3Color, fontSize: 20),
                labelStyle: const TextStyle(color: AppPallete.label3Color),
                fillColor: AppPallete.backgroundClosed,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                editableText: false,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
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
