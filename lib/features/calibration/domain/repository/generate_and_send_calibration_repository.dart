import 'package:dartz/dartz.dart';

import '../../data/model/model_delete_calibration/request_delete_calibration_model.dart';

abstract class GenerateAndSendCalibrationRepository {
  Future<Either> generateAndSendCalibrationItems(
    RequestDeleteCalibrationModel requestDeleteCalibrationModel,
  );
}
