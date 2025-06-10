import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_delete_calibration/request_delete_calibration_model.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/delete_calibration_item_repository.dart';

class DeleteCalibrationUsecase
    implements UseCase<Either, RequestDeleteCalibrationModel> {
  @override
  Future<Either> call({RequestDeleteCalibrationModel? params}) async {
    return await sl<DeleteCalibrationItemRepository>()
        .deleteCalibrationItems(params!);
  }
}
