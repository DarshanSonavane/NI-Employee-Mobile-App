import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/customer_profile/data/source/search_customer_profile_service.dart';
import 'package:employee_ni_service/features/customer_profile/domain/repository/search_customer_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class SearchCustomerProfileRepositoryImpl
    extends SearchCustomerProfileRepository {
  @override
  Future<Either> searchCustomerRepository(String query) {
    return sl<SearchCustomerProfileService>().searchCustomer(query: query);
  }
}
