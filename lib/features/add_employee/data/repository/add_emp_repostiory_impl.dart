import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/add_employee/data/model/request_add_employee.dart';
import 'package:employee_ni_service/features/add_employee/data/source/create_employee_service.dart';
import 'package:employee_ni_service/features/add_employee/domain/repository/add_employee_repository.dart';

import '../../../../service_locator_dependecies.dart';

class AddEmpRepostioryImpl extends AddEmployeeRepository {
  @override
  Future<Either> addEmployee(RequestAddEmployee requestAddEmployee) {
    return sl<CreateEmployeeService>().createNewEmp(requestAddEmployee);
  }
}
