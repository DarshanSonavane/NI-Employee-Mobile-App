import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/request_delete_calibration_model.dart';
import 'package:employee_ni_service/features/calibration/data/source/delete_calibration_item_api_service.dart';
import 'package:employee_ni_service/features/calibration/domain/repository/delete_calibration_item_repository.dart';
import '../../../../service_locator_dependecies.dart';

class DeleteCalibrationItemRepositoryImpl
    extends DeleteCalibrationItemRepository {
  @override
  Future<Either> deleteCalibrationItems(
      RequestDeleteCalibrationModel requestDeleteCalibrationModel) {
    return sl<DeleteCalibrationItemApiService>()
        .deleteCalibrationItems(requestDeleteCalibrationModel);
  }
}
