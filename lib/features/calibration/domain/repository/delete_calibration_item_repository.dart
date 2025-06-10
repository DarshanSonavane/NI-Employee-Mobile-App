import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/request_delete_calibration_model.dart';

abstract class DeleteCalibrationItemRepository {
  Future<Either> deleteCalibrationItems(
    RequestDeleteCalibrationModel requestDeleteCalibrationModel,
  );
}
