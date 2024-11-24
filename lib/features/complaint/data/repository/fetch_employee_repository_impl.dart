import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/complaint/domain/repository/fetch_employee_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/get_employee_detail_api_service.dart';

class FetchEmployeeRepositoryImpl extends FetchEmployeeRepository {
  @override
  Future<Either> getEmployeeDetails() {
    return sl<GetEmployeeDetailApiService>().getEmployeeDetails();
  }
}
