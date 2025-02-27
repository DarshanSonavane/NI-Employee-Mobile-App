import 'package:flutter/material.dart';
import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/features/home/domain/entities/entity_fsr_list.dart';

class ProductsUsedSection extends StatefulWidget {
  final List<ProductUsedEntity> productsUsed;
  final String fsrFinalAmount;
  final String fsrGstAmount;

  const ProductsUsedSection(
      {super.key,
      required this.productsUsed,
      required this.fsrFinalAmount,
      required this.fsrGstAmount});

  @override
  State<ProductsUsedSection> createState() => ProductsUsedSectionState();
}

class ProductsUsedSectionState extends State<ProductsUsedSection> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    debugPrint("FsrFinalAmount: ${widget.fsrFinalAmount}");
    debugPrint("FsrGstAmount: ${widget.fsrGstAmount}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomGlolbalText(
              text: "Products Used",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppPallete.label3Color,
            ),
            IconButton(
              icon: Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
                color: AppPallete.label3Color,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ],
        ),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox.shrink(),
          secondChild: Column(
            children: [
              ...widget.productsUsed.map((product) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomGlolbalText(
                            text: product.productName,
                            fontSize: 14,
                            color: AppPallete.label3Color,
                          ),
                          CustomGlolbalText(
                            text: "Quantity: ${product.quantityUsed}",
                            fontSize: 12,
                            color: AppPallete.label2Color,
                          ),
                        ],
                      ),

                      // Price
                      CustomGlolbalText(
                        text: "Price: ₹${product.gstAmount}",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppPallete.label3Color,
                      ),
                    ],
                  ),
                );
              }),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomGlolbalText(
                  text:
                      "Total: ₹${(double.parse(widget.fsrFinalAmount).toStringAsFixed(2))}",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.label3Color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
