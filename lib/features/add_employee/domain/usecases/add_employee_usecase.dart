import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/add_employee/data/model/request_add_employee.dart';
import 'package:employee_ni_service/features/add_employee/domain/repository/add_employee_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

class AddEmployeeUsecase implements UseCase<Either, RequestAddEmployee> {
  @override
  Future<Either> call({RequestAddEmployee? params}) async {
    return sl<AddEmployeeRepository>().addEmployee(params!);
  }
}
