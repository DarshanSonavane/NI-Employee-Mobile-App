import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_cylinder_details/response_cylinder_details.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class GetCylinderDetailsApiService {
  Future<Either> getCylinderDetails();
}

class GetCylinderDetailsApiServiceImpl extends GetCylinderDetailsApiService {
  @override
  Future<Either> getCylinderDetails() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getCylinderDetails);
      var getCylinderDetailsResponse =
          ResponseCylinderDetails.fromMap(response.data);
      return Right(getCylinderDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
