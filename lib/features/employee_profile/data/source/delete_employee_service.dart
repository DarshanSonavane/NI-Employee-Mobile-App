import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/employee_profile/data/model/response_delete_emp.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

abstract class DeleteEmployeeService {
  Future<Either> deleteEmp(String employeeId);
}

class DeleteEmployeeServiceImpl extends DeleteEmployeeService {
  @override
  Future<Either> deleteEmp(String employeeId) async {
    try {
      var response = await sl<DioClient>()
          .get(ApiUrls.deleteEmployee, queryParameters: {'id': employeeId});
      var responseDeleteEmployee = ResponseDeleteEmp.fromJson(response.data);
      return Right(responseDeleteEmployee);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
