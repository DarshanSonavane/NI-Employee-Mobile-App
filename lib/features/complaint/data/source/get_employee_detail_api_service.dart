import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_fetch_employee/response_employee_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class GetEmployeeDetailApiService {
  Future<Either> getEmployeeDetails();
}

class GetEmployeeDetailsApiServiceImpl extends GetEmployeeDetailApiService {
  @override
  Future<Either> getEmployeeDetails() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.fetchEmployeeDetails);
      var getEmployeeDetailsResponse =
          ResponseEmployeeModel.fromMap(response.data);
      return Right(getEmployeeDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
