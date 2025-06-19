import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:flutter/material.dart';

class NotificationAppreciationListWidget extends StatelessWidget {
  final Map<String, String> item;
  final bool hasImage;
  const NotificationAppreciationListWidget({
    super.key,
    required this.item,
    required this.hasImage,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    CustomGlolbalText(
                      text: item['text'] ?? '',
                      color: AppPallete.label3Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    CustomGlolbalText(
                      text: item['date'] ?? '',
                      color: AppPallete.label3Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (hasImage) ...[
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item['imgUrl']!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
