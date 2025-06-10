import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/request_delete_calibration_model.dart';
import 'package:employee_ni_service/features/calibration/domain/repository/generate_and_send_calibration_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/generate_and_send_calibration_item_api_service.dart';

class GenerateAndSendCalibrationRepositoryImpl
    extends GenerateAndSendCalibrationRepository {
  @override
  Future<Either> generateAndSendCalibrationItems(
      RequestDeleteCalibrationModel requestDeleteCalibrationModel) {
    return sl<GenerateAndSendCalibrationItemApiService>()
        .generateAndSendCalibrationItems(requestDeleteCalibrationModel);
  }
}
