import 'package:employee_ni_service/features/add_notification_appreciation/domain/entities/entity_add_appreciation.dart';

class ModelAddAppreciationRequest extends EntityAddAppreciation {
  ModelAddAppreciationRequest({
    required super.key,
    required super.employeeId,
    required super.description,
  });

  factory ModelAddAppreciationRequest.fromJson(Map<String, dynamic> json) {
    return ModelAddAppreciationRequest(
      key: json['key'],
      employeeId: json['employeeId'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "key": key,
      "employeeId": employeeId,
      "description": description,
    };
  }
}
