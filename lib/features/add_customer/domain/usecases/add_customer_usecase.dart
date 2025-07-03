import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/add_customer/data/model/model_add_customer.dart';
import 'package:employee_ni_service/features/add_customer/domain/repository/create_customer_repository.dart';

import '../../../../service_locator_dependecies.dart';

class AddCustomerUsecase extends UseCase<Either, ModelAddCustomer> {
  @override
  Future<Either> call({ModelAddCustomer? params}) {
    return sl<CreateCustomerRepository>().addCustomer(params!);
  }
}
