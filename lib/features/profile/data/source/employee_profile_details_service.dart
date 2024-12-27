import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/profile/data/model/request_employee_profile.dart';
import 'package:employee_ni_service/features/profile/data/model/response_employee_profile.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class EmployeeProfileDetailsService {
  Future<Either> sendEmployeeId(RequestEmployeeProfile params);
}

class EmployeeProfileDetailsServiceImpl extends EmployeeProfileDetailsService {
  @override
  Future<Either> sendEmployeeId(RequestEmployeeProfile params) async {
    try {
      var response = await sl<DioClient>()
          .get(ApiUrls.getEmployeeDetails, queryParameters: params.toMap());
      var getEmployeeProfileResponse =
          ResponseEmployeeProfile.fromJson(response.data);
      return Right(getEmployeeProfileResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
