import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/features/customer_profile/domain/entities/entity_customer_profile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerListWidget extends StatefulWidget {
  final CustomerProfileData item;
  final Function(CustomerProfileData)? onEdit;
  final Function(String)? onDelete;

  const CustomerListWidget({
    super.key,
    required this.item,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<CustomerListWidget> createState() => _CustomerListWidgetState();
}

class _CustomerListWidgetState extends State<CustomerListWidget> {
  @override
  Widget build(BuildContext context) {
    final custName = widget.item.customerName ?? '';
    final email = widget.item.email ?? '';
    final mobile = widget.item.mobile ?? '';
    final amcDue = widget.item.amcDue ?? '';
    final gstNo = widget.item.gstNo ?? '';
    final city = widget.item.city ?? '';
    final state = widget.item.state ?? '';
    final custCode = widget.item.customerCode ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Card(
        color: AppPallete.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomGlolbalText(
                          text: custName,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppPallete.label3Color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.edit,
                            size: 20, color: AppPallete.gradientColor),
                        onPressed: () => widget.onEdit!(widget.item),
                        tooltip: 'Edit',
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete,
                            size: 20, color: AppPallete.errorColor),
                        onPressed: () =>
                            widget.onDelete!(widget.item.sId ?? ""),
                        tooltip: 'Delete',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  CustomGlolbalText(
                    text: "Customer code: $custCode",
                    fontSize: 15,
                    color: AppPallete.label3Color,
                  ),
                  const SizedBox(height: 8),
                  CustomGlolbalText(
                    text: "Email: $email",
                    fontSize: 15,
                    color: AppPallete.label3Color,
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () => launchUrl(Uri.parse("tel:$mobile")),
                    child: Row(
                      children: [
                        const CustomGlolbalText(
                          text: "Mobile:",
                          color: AppPallete.label3Color,
                        ),
                        const SizedBox(width: 6),
                        CustomGlolbalText(
                          text: mobile,
                          color: AppPallete.gradientColor,
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  CustomGlolbalText(
                    text: "AMC Due: $amcDue",
                    fontSize: 15,
                    color: AppPallete.label3Color,
                  ),
                  const SizedBox(height: 6),
                  CustomGlolbalText(
                    text: "GST No: $gstNo",
                    fontSize: 15,
                    color: AppPallete.label3Color,
                  ),
                  const SizedBox(height: 6),
                  CustomGlolbalText(
                    text: "City: $city, State: $state",
                    fontSize: 15,
                    color: AppPallete.label3Color,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
