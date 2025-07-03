import 'package:employee_ni_service/features/add_customer/domain/entities/response_create_customer_entity.dart';

class ResponseAddCustomerModal extends ResponseCreateCustomerEntity {
  ResponseAddCustomerModal({
    required super.code,
    required super.message,
  });

  factory ResponseAddCustomerModal.fromJson(Map<String, dynamic> json) {
    return ResponseAddCustomerModal(
      code: json['code'],
      message: json['message'],
    );
  }
}
