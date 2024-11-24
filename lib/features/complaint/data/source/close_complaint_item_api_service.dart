import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/complaint/data/models/common_response_model/common_response_complaint_model.dart';
import 'package:employee_ni_service/features/complaint/data/models/model_close_complaint/request_close_complaint_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class CloseComplaintItemApiService {
  Future<Either> closeComplaintItem(
      RequestCloseComplaintModel requestCloseComplaintModel, String source);
}

class CloseComplaintItemApiServiceImpl extends CloseComplaintItemApiService {
  @override
  Future<Either> closeComplaintItem(
      RequestCloseComplaintModel requestCloseComplaintModel,
      String source) async {
    try {
      var response = await sl<DioClient>().post(
          source == Constants.close
              ? ApiUrls.closeComplaintItem
              : ApiUrls.assignComplaints,
          data: requestCloseComplaintModel.toMap());
      var deleteCalibrationItemResponse =
          CommonResponseComplaintModel.fromMap(response.data);
      return Right(deleteCalibrationItemResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
