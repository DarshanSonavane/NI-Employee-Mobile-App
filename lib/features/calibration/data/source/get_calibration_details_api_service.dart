import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/core/utils/fetch_user_role.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_calibration_details/response_calibration_details.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_request_calibration_model/request_get_all_calibration_model.dart';
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
      String apiUrl;
      Response response;
      if (fetchUserRole() == "0") {
        apiUrl = params?.typeOfData == Constants.activeCalibration
            ? ApiUrls.getActiveCalibrationDetails
            : ApiUrls.getClosedCalibrationDetails;
        response = await sl<DioClient>().get(apiUrl);
      } else {
        apiUrl = ApiUrls.getAllCalibrationDetails;
        final requestGetAllCalibrationModel =
            RequestGetAllCalibrationModel(employeeId: fetchUserId());
        response = await sl<DioClient>()
            .post(apiUrl, data: requestGetAllCalibrationModel.toMap());
      }
      var getCalibrationDetailsResponse =
          ResponseCalibrationDetails.fromMap(response.data);
      return Right(getCalibrationDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
