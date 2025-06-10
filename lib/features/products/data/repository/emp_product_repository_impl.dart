import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/products/data/source/fetch_employee_assigned_product_service.dart';
import 'package:employee_ni_service/features/products/domain/repository/emp_product_repository.dart';
import 'package:employee_ni_service/features/profile/data/model/request_employee_profile.dart';

import '../../../../service_locator_dependecies.dart';

class EmpProductRepositoryImpl extends EmpProductRepository {
  @override
  Future<Either> fetchProducts(RequestEmployeeProfile params) {
    return sl<FetchEmployeeAssignedProductsService>().fetchEmpProduct(params);
  }
}
