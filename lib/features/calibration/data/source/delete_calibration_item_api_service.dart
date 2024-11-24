import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/request_delete_calibration_model.dart';
import 'package:employee_ni_service/features/calibration/data/model/common_response_model/common_response_calibration_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class DeleteCalibrationItemApiService {
  Future<Either> deleteCalibrationItems(
      RequestDeleteCalibrationModel requesteDeleteCalibrationModel);
}

class DeleteCalibrationItemApiServiceImpl
    extends DeleteCalibrationItemApiService {
  @override
  Future<Either> deleteCalibrationItems(
      RequestDeleteCalibrationModel requesteDeleteCalibrationModel) async {
    try {
      var response = await sl<DioClient>().post(ApiUrls.deleteCalibrationItem,
          data: requesteDeleteCalibrationModel.toMap());
      var deleteCalibrationItemResponse =
          CommonResponseCalibrationModel.fromMap(response.data);
      return Right(deleteCalibrationItemResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
