import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/custom_drop_down.dart';
import '../../../../core/common/widgets/custom_global_text.dart';
import '../../data/models/model_master_inventory.dart';

class MasterInventorySection extends StatelessWidget {
  final String? selectedProduct;
  final ModelMasterInventory? masterInventory;
  final Function(String?) onProductSelected;

  const MasterInventorySection({
    super.key,
    required this.selectedProduct,
    required this.masterInventory,
    required this.onProductSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomGlolbalText(
          text: "Master Inventory",
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: AppPallete.label3Color,
        ),
        const SizedBox(height: 16),
        CustomDropdown<String>(
          value: selectedProduct,
          hintText: "Choose Products",
          items: masterInventory?.data
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
          onChanged: onProductSelected,
          borderColor: AppPallete.gradientColor,
          iconColor: AppPallete.deepNavy,
          textColor: AppPallete.label3Color,
          dropdownColor: AppPallete.backgroundColor,
        ),
      ],
    );
  }
}
