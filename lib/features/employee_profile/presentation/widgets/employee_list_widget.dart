import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeListWidget extends StatefulWidget {
  final Map<String, String> item;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const EmployeeListWidget({
    super.key,
    required this.item,
    this.onEdit,
    this.onDelete,
  });

  @override
  State<EmployeeListWidget> createState() => _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  @override
  Widget build(BuildContext context) {
    final fullName =
        "${widget.item['firstName'] ?? ''} ${widget.item['lastName'] ?? ''}";
    final mobile = widget.item['mobileNo'] ?? '';
    final email = widget.item['email'] ?? '';
    final date = widget.item['date'] ?? '';
    final gender = widget.item['gender'] ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Card(
        color: AppPallete.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomGlolbalText(
                    text: "Name: $fullName",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.label3Color,
                  ),
                  const SizedBox(height: 6),
                  CustomGlolbalText(
                    text: "Email: $email",
                    fontSize: 16,
                    color: AppPallete.label3Color,
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () {
                      final Uri uri = Uri.parse("tel:$mobile");
                      launchUrl(uri);
                    },
                    child: Row(
                      spacing: 6,
                      children: [
                        const CustomGlolbalText(
                          text: "Mobile:",
                          color: AppPallete.label3Color,
                        ),
                        CustomGlolbalText(
                          text: mobile,
                          color: AppPallete.gradientColor,
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Date: $date",
                    style: const TextStyle(color: AppPallete.label3Color),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Gender: $gender",
                    style: const TextStyle(color: AppPallete.label3Color),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                    onPressed: widget.onEdit,
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                    onPressed: widget.onDelete,
                    tooltip: 'Delete',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
