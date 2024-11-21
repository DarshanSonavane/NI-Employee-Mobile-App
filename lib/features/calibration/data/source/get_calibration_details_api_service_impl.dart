import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_calibration_details/response_calibration_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class GetCalibrationDetailApiService {
  Future<Either> getCalibrationDetails();
}

class GetCalibrationDetailsApiServiceImpl
    extends GetCalibrationDetailApiService {
  @override
  Future<Either> getCalibrationDetails() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getCalibrationDetails);
      var getCalibrationDetailsResponse =
          ResponseCalibrationDetails.fromMap(response.data);
      return Right(getCalibrationDetailsResponse);
    } on DioException catch (e) {
      debugPrint("errorMesssage ${e.message}");
      return left(e.message);
    }
  }
}
