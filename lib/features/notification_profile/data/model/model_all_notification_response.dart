import 'package:employee_ni_service/features/notification_profile/domain/entities/entity_all_notification_response.dart';

class ModelAllNotificationResponse extends EntityAllNotificationResponse {
  ModelAllNotificationResponse({
    required super.code,
    required super.message,
    required super.notificationData,
  });

  factory ModelAllNotificationResponse.fromJson(Map<String, dynamic> json) {
    return ModelAllNotificationResponse(
      code: json['code'] as String,
      message: json['message'],
      notificationData: (json['data'] as List<dynamic>?)
              ?.map((e) => ModelNotificationData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class ModelNotificationData extends NotificationData {
  ModelNotificationData({
    required super.id,
    required super.file,
    required super.extension,
    required super.notes,
    required super.createdTime,
  });

  factory ModelNotificationData.fromJson(Map<String, dynamic> json) {
    return ModelNotificationData(
      id: json['_id'] ?? '',
      file: json['file'] ?? '',
      extension: json['extension'] ?? '',
      notes: json['notes'] ?? '',
      createdTime: json['createdAt'] ?? '',
    );
  }
}
