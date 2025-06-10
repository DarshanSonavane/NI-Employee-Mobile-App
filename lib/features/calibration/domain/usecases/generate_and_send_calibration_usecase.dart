import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';

import '../../../../service_locator_dependecies.dart';
import '../../data/model/model_delete_calibration/request_delete_calibration_model.dart';
import '../repository/generate_and_send_calibration_repository.dart';

class GenerateAndSendCalibrationUsecase
    extends UseCase<Either, RequestDeleteCalibrationModel> {
  @override
  Future<Either> call({RequestDeleteCalibrationModel? params}) async {
    return await sl<GenerateAndSendCalibrationRepository>()
        .generateAndSendCalibrationItems(params!);
  }
}
