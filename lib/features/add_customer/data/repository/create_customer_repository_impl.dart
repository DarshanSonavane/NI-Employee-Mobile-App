import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/add_customer/data/model/model_add_customer.dart';
import 'package:employee_ni_service/features/add_customer/data/source/create_customer_service.dart';
import 'package:employee_ni_service/features/add_customer/domain/repository/create_customer_repository.dart';

import '../../../../service_locator_dependecies.dart';

class CreateCustomerRepositoryImpl extends CreateCustomerRepository {
  @override
  Future<Either> addCustomer(ModelAddCustomer modelAddCustomer) {
    return sl<CreateCustomerService>().createCustomer(modelAddCustomer);
  }
}
