import 'package:employee_ni_service/features/add_notification_appreciation/domain/entities/entity_add_notification.dart';

class ModelAddNotificationRequest extends EntityAddNotification {
  ModelAddNotificationRequest({
    required super.message,
    super.base64File,
    super.fileExtension,
  });

  factory ModelAddNotificationRequest.fromJson(Map<String, dynamic> json) {
    return ModelAddNotificationRequest(
        message: json['notes'] as String,
        fileExtension: json['extension'] as String,
        base64File: json['file'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'notes': message,
      'file': base64File,
      'extension': fileExtension,
    };
  }
}
