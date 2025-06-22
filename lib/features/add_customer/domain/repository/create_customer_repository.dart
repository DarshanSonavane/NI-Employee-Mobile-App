import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/add_customer/data/model/model_add_customer.dart';

abstract class CreateCustomerRepository {
  Future<Either> addCustomer(ModelAddCustomer modelAddCustomer);
}
