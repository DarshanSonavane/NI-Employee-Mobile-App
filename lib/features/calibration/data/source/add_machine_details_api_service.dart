import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/calibration/data/model/common_response_model/common_response_calibration_model.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_add_machine/request_add_machine_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class AddMachineDetailsApiService {
  Future<Either> addMachineDetails(
      RequestAddMachineModel requestAddMachineModel);
}

class AddMachineDetailsApiServiceImpl extends AddMachineDetailsApiService {
  @override
  Future<Either> addMachineDetails(
      RequestAddMachineModel requestAddMachineModel) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.addMachine, data: requestAddMachineModel.toMap());
      var addMachineDetailsResponse =
          CommonResponseCalibrationModel.fromMap(response.data);
      return Right(addMachineDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
