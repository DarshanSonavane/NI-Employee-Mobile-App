import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerListWidget extends StatefulWidget {
  final Map<String, String> item;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

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
    final custName = widget.item['custName'] ?? '';
    final email = widget.item['email'] ?? '';
    final mobile = widget.item['mobileNo'] ?? '';
    final amcDue = widget.item['amcDue'] ?? '';
    final gstNo = widget.item['gstNo'] ?? '';
    final city = widget.item['city'] ?? '';
    final state = widget.item['state'] ?? '';

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
              // Main content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: name and space for icons
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
                            size: 20, color: Colors.blue),
                        onPressed: widget.onEdit,
                        tooltip: 'Edit',
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete,
                            size: 20, color: Colors.red),
                        onPressed: widget.onDelete,
                        tooltip: 'Delete',
                      ),
                    ],
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
