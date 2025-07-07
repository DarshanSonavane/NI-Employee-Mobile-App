import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/add_employee/data/model/request_add_employee.dart';

abstract class AddEmployeeRepository {
  Future<Either> addEmployee(RequestAddEmployee requestAddEmployee);
}
