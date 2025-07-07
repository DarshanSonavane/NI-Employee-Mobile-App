import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/customer_profile/data/source/fetch_customer_profile_service.dart';
import 'package:employee_ni_service/features/customer_profile/domain/repository/fetch_customer_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchCustomerProfileRepositoryImpl
    extends FetchCustomerProfileRepository {
  @override
  Future<Either> fetchCustomerRepository({int page = 1}) {
    return sl<FetchCustomerProfileService>().fetchCustomer(page: page);
  }
}
