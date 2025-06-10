import 'package:dartz/dartz.dart';

import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/fetch_calibration_repository.dart';

class FetchCalibrationData implements UseCase<Either, ParamsAsType> {
  @override
  Future<Either> call({ParamsAsType? params}) async {
    return await sl<FetchCalibrationRepository>().getCalibrationDetails(params);
  }
}
