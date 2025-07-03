import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_delete_customer_request.dart';

abstract class DeleteCustomerProfileRepository {
  Future<Either> deleteCustomerProfile(
      ModelDeleteCustomerRequest modelDeleteCustomerRequest);
}
