import 'package:employee_ni_service/features/add_notification_appreciation/domain/entities/entity_add_notification_reponse.dart';

class ModelAddNotificationResponse extends EntityAddNotificationReponse {
  ModelAddNotificationResponse({
    required super.code,
    required super.message,
  });

  factory ModelAddNotificationResponse.fromJson(Map<String, dynamic> json) {
    return ModelAddNotificationResponse(
      code: json['code'],
      message: json['message'],
    );
  }
}
