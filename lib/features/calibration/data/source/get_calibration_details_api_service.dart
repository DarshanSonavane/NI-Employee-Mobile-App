import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_calibration_details/response_calibration_details.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class GetCalibrationDetailApiService {
  Future<Either> getCalibrationDetails(ParamsAsType? params);
}

class GetCalibrationDetailsApiServiceImpl
    extends GetCalibrationDetailApiService {
  @override
  Future<Either> getCalibrationDetails(ParamsAsType? params) async {
    try {
      var response = await sl<DioClient>().get(
          params?.typeOfData == Constants.activeCalibration
              ? ApiUrls.getActiveCalibrationDetails
              : ApiUrls.getClosedCalibrationDetails);
      var getCalibrationDetailsResponse =
          ResponseCalibrationDetails.fromMap(response.data);
      return Right(getCalibrationDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
