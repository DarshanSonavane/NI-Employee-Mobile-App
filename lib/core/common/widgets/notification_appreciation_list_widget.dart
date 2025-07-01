import 'package:employee_ni_service/core/app_theme/app_pallete.dart';
import 'package:employee_ni_service/core/common/widgets/custom_global_text.dart';
import 'package:employee_ni_service/core/utils/date_convertor.dart';
import 'package:employee_ni_service/core/utils/generate_thumbnail.dart';
import 'package:employee_ni_service/core/utils/get_image_path.dart';
import 'package:employee_ni_service/features/appreciation_profile/domain/entity/entity_all_appreciation_response.dart';
import 'package:employee_ni_service/features/notification_profile/domain/entities/entity_all_notification_response.dart';
import 'package:flutter/material.dart';

class NotificationAppreciationListWidget extends StatelessWidget {
  final NotificationData? itemNotification;
  final AppreciationData? itemAppreciation;
  final bool hasFile;
  final bool isAppreciation;
  const NotificationAppreciationListWidget({
    super.key,
    this.itemNotification,
    this.itemAppreciation,
    required this.hasFile,
    this.isAppreciation = false,
  });

  Widget _buildFileWidget() {
    if (isAppreciation && itemAppreciation != null) {
      final imagePath = getImagePathFromKey(itemAppreciation?.key ?? '');
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Fallback if image not found
            return Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.image_not_supported,
                color: Colors.grey[600],
                size: 30,
              ),
            );
          },
        ),
      );
    } else if (!isAppreciation && itemNotification != null) {
      // For notification, use the existing GenerateThumbnail logic
      return GenerateThumbnail.buildFileThumbnail(
          itemNotification!.file, itemNotification!.extension);
    } else {
      // Fallback widget
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.help_outline,
          color: Colors.grey[600],
          size: 30,
        ),
      );
    }
  }

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
                      text: isAppreciation
                          ? (itemAppreciation?.description ?? '')
                          : (itemNotification?.notes ?? ''),
                      color: AppPallete.label3Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    CustomGlolbalText(
                      text: isAppreciation
                          ? (itemAppreciation?.createdTime.toDisplayDate() ??
                              '')
                          : (itemNotification?.createdTime.toDisplayDate() ??
                              ''),
                      color: AppPallete.label3Color,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (hasFile) ...[
                const SizedBox(width: 12),
                _buildFileWidget(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
