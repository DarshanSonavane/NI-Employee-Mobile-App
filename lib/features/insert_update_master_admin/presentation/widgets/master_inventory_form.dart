import 'package:employee_ni_service/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/auth_gradient_button.dart';
import 'package:employee_ni_service/core/common/widgets/custom_drop_down.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/core/common/widgets/custom_text_field.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/model_master_inventory.dart';

class MasterInventoryForm extends StatefulWidget {
  final ModelMasterInventory? inventoryItems;
  final Function(String? selectedProductId, String? newProductName,
      int quantity, double price, String? productCode) onSubmit;

  const MasterInventoryForm({
    super.key,
    required this.inventoryItems,
    required this.onSubmit,
  });

  @override
  MasterInventoryFormState createState() => MasterInventoryFormState();
}

class MasterInventoryFormState extends State<MasterInventoryForm> {
  TextEditingController newProductController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  String? selectedProductId;
  String? selectedProductName;
  bool isTextFieldEnabled = true;
  bool isProductCodeEditable = true;

  void resetForm() {
    setState(() {
      newProductController.clear();
      quantityController.clear();
      priceController.clear();
      productCodeController.clear();
      selectedProductId = null;
      selectedProductName = null;
      isTextFieldEnabled = true;
      isProductCodeEditable = true;
    });
  }

  void onProductSelected(String? value) {
    setState(() {
      if (value != null && value.isNotEmpty) {
        selectedProductId = value;
        var selectedProduct =
            widget.inventoryItems?.data.firstWhere((item) => item.id == value);
        selectedProductName = selectedProduct?.productName;
        productCodeController.text = selectedProduct?.productCode ?? "";
        priceController.text = selectedProduct?.price.toString() ?? "";
        selectedProduct?.price.toString() ?? "";
        newProductController.clear();
        isProductCodeEditable = false;
        isTextFieldEnabled = false;
      } else {
        productCodeController.clear();
        priceController.clear();
        isProductCodeEditable = true;
        selectedProductId = null;
        selectedProductName = null;
        isTextFieldEnabled = true;
      }
    });
  }

  void onTextFieldChanged(String value) {
    setState(() {
      if (value.isNotEmpty) {
        selectedProductId = null;
        selectedProductName = null;
        productCodeController.clear();
        isProductCodeEditable = true;
      }
    });
  }

  void validateAndSubmit() {
    if (newProductController.text.isEmpty && selectedProductId == null) {
      showSnackBar(context, "Please select a product or enter a new one",
          backgroundColor: AppPallete.errorColor);
      return;
    }
    if (quantityController.text.isEmpty) {
      showSnackBar(context, "Quantity cannot be empty",
          backgroundColor: AppPallete.errorColor);
      return;
    }
    if (priceController.text.isEmpty) {
      showSnackBar(context, "Price cannot be empty",
          backgroundColor: AppPallete.errorColor);
      return;
    }

    widget.onSubmit(
      selectedProductId,
      selectedProductId == null
          ? newProductController.text
          : selectedProductName,
      int.parse(quantityController.text),
      double.parse(priceController.text),
      productCodeController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: AppPallete.backgroundColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomGlolbalText(
                    text: "Add or Update Products",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.deepNavy,
                  ),
                  const SizedBox(height: 20),
                  CustomDropdown<String>(
                    value: selectedProductId,
                    hintText: "Choose Products",
                    items: [
                      const DropdownMenuItem<String>(
                        value: "",
                        child: Text("Choose Product"),
                      ),
                      ...widget.inventoryItems?.data
                              .map((item) => DropdownMenuItem<String>(
                                    value: item.id,
                                    child: CustomGlolbalText(
                                      text: item.productName,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppPallete.deepNavy,
                                    ),
                                  ))
                              .toList() ??
                          [],
                    ],
                    onChanged: onProductSelected,
                    isEnabled: newProductController.text.isEmpty,
                    borderColor: AppPallete.gradientColor,
                    iconColor: AppPallete.deepNavy,
                    textColor: AppPallete.label3Color,
                    dropdownColor: AppPallete.backgroundColor,
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: CustomGlolbalText(
                      text: "---------- OR ----------",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.deepNavy,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: "Enter New Product",
                    controller: newProductController,
                    textStyle: const TextStyle(
                        color: AppPallete.label3Color, fontSize: 16),
                    labelStyle: const TextStyle(color: AppPallete.deepNavy),
                    fillColor: AppPallete.backgroundClosed,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    editableText: selectedProductId == null,
                    onChanged: onTextFieldChanged,
                    isDisabled: !isTextFieldEnabled,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            labelText: "Enter Product Code",
            controller: productCodeController,
            textStyle: const TextStyle(
              color: AppPallete.label3Color,
              fontSize: 16,
            ),
            labelStyle: const TextStyle(color: AppPallete.deepNavy),
            fillColor: AppPallete.backgroundClosed,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            editableText: isProductCodeEditable,
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  selectedProductId =
                      null; // If user types, reset dropdown selection
                }
              });
            },
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            labelText: "Enter Quantity",
            controller: quantityController,
            textStyle:
                const TextStyle(color: AppPallete.label3Color, fontSize: 16),
            labelStyle: const TextStyle(color: AppPallete.deepNavy),
            fillColor: AppPallete.backgroundClosed,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            editableText: true,
            isNumberField: true,
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
            labelText: "Enter Price (Per Item)",
            controller: priceController,
            textStyle:
                const TextStyle(color: AppPallete.label3Color, fontSize: 16),
            labelStyle: const TextStyle(color: AppPallete.deepNavy),
            fillColor: AppPallete.backgroundClosed,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            editableText: isProductCodeEditable,
            isNumberField: true,
          ),
          const SizedBox(height: 25),
          AuthGradientButton(
            buttonText: "Submit",
            startColor: AppPallete.buttonColor,
            endColor: AppPallete.gradientColor,
            width: MediaQuery.of(context).size.width,
            height: 55,
            onPressed: validateAndSubmit,
          ),
        ],
      ),
    );
  }
}
