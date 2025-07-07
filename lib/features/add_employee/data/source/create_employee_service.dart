import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/add_employee/data/model/request_add_employee.dart';
import 'package:employee_ni_service/features/add_employee/data/model/response_created_employee.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

abstract class CreateEmployeeService {
  Future<Either> createNewEmp(RequestAddEmployee requestAddEmployee);
}

class CreateEmployeeServiceImpl extends CreateEmployeeService {
  @override
  Future<Either> createNewEmp(RequestAddEmployee requestAddEmployee) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.createEmployee, data: requestAddEmployee);
      var responseAddedEmployee =
          ResponseCreatedEmployee.fromJson(response.data);
      return Right(responseAddedEmployee);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
