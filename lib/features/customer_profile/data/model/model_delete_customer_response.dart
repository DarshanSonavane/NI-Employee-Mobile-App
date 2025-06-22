import 'package:employee_ni_service/features/customer_profile/domain/entities/entity_delete_response.dart';

class ModelDeleteCustomerResponse extends EntityDeleteResponse {
  ModelDeleteCustomerResponse({required super.message});

  factory ModelDeleteCustomerResponse.fromJson(Map<String, dynamic> json) {
    return ModelDeleteCustomerResponse(
      message: json['message'],
    );
  }
}
