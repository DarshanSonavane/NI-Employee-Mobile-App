import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/common/widgets/custom_global_text.dart';
import '../../../fsr_list_detail/presentation/widgets/product_used_section.dart';
import '../../domain/entities/entity_fsr_list.dart';

class FSRDetailsCard extends StatelessWidget {
  final FsrDataEntity fsr;
  final bool isDetailsScreen;
  const FSRDetailsCard({
    super.key,
    required this.fsr,
    this.isDetailsScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.backgroundColor,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomGlolbalText(
              text:
                  "${fsr.customerInfo.customerName}, ${fsr.customerInfo.city}, ${fsr.customerInfo.stateCode}",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppPallete.label3Color,
            ),
            CustomGlolbalText(
              text: "Customer Code: ${fsr.customerCode}",
              fontSize: 14,
              color: AppPallete.label2Color,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            CustomGlolbalText(
              text: "Complaint: ${fsr.complaintType}",
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppPallete.label3Color,
            ),
            CustomGlolbalText(
              text: "Nature of Complaint: ${fsr.natureOfCompliant}",
              fontSize: 14,
              color: AppPallete.label3Color,
            ),
            CustomGlolbalText(
              text:
                  "Resolved by: ${fsr.employeeInfo.firstName} ${fsr.employeeInfo.lastName}${isDetailsScreen ? ' (${fsr.designation})' : ''}",
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: AppPallete.bottomNavigationButton,
            ),
            if (isDetailsScreen) ...[
              CustomGlolbalText(
                text: "FSR Location: ${fsr.fsrLocation}",
                fontSize: 14,
                color: AppPallete.label3Color,
              ),
              CustomGlolbalText(
                text:
                    "Service Charge: ${fsr.serviceCharge == "0" ? "No" : "Yes"}",
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: AppPallete.bottomNavigationButton,
              ),
              ProductsUsedSection(
                  productsUsed: fsr.productsUsed,
                  fsrFinalAmount: fsr.fsrFinalAmount,
                  fsrGstAmount: fsr.fsrFinalGstAmount),
            ],
          ],
        ),
      ),
    );
  }
}
