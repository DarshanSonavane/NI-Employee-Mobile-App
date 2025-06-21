import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/features/complaint/domain/entities/entity_response_employee_details/employee_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeListWidget extends StatefulWidget {
  final EmployeeData? item;
  final Function(String)? onDelete;
  const EmployeeListWidget({
    super.key,
    required this.item,
    this.onDelete,
  });

  @override
  State<EmployeeListWidget> createState() => _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  @override
  Widget build(BuildContext context) {
    final fullName =
        "${widget.item?.firstName ?? ''} ${widget.item?.lastName ?? ''}";
    final mobile = widget.item?.phone ?? '';
    final email = widget.item?.email ?? '';
    final date = widget.item?.dob ?? '';
    final gender = widget.item?.gender ?? '';
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
                    "Gender: ${gender == "1" ? "Male" : "Female"}",
                    style: const TextStyle(color: AppPallete.label3Color),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                onPressed: () => widget.onDelete!(widget.item?.sId ?? ""),
                tooltip: 'Delete',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
