import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_delete_customer_request.dart';
import 'package:employee_ni_service/features/customer_profile/data/source/delete_customer_service.dart';
import 'package:employee_ni_service/features/customer_profile/domain/repository/delete_customer_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class DeleteCustomerProfileRepositoryImpl
    extends DeleteCustomerProfileRepository {
  @override
  Future<Either> deleteCustomerProfile(
      ModelDeleteCustomerRequest modelDeleteCustomer) {
    return sl<DeleteCustomerService>().deleteCustomer(modelDeleteCustomer);
  }
}
