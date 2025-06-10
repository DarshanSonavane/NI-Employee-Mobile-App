import 'package:dartz/dartz.dart';

import '../../../profile/data/model/request_employee_profile.dart';

abstract class EmpProductRepository {
  Future<Either> fetchProducts(RequestEmployeeProfile params);
}
