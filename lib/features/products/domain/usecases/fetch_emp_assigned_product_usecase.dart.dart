import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/products/domain/repository/emp_product_repository.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../../../profile/data/model/request_employee_profile.dart';

class FetchEmpAssignedProductUsecase
    implements UseCase<Either, RequestEmployeeProfile> {
  @override
  Future<Either> call({RequestEmployeeProfile? params}) {
    return sl<EmpProductRepository>().fetchProducts(params!);
  }
}
