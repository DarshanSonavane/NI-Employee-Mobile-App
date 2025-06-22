import 'package:employee_ni_service/features/customer_profile/domain/entities/entity_delete_customer.dart';

class ModelDeleteCustomerRequest extends EntityDeleteCustomer {
  ModelDeleteCustomerRequest({
    required super.customerId,
  });

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
      };
}
