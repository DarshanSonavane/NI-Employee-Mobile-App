import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/calibration/domain/repository/fetch_calibration_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/get_calibration_details_api_service.dart';

class FetchCalibrationRepositoryImpl extends FetchCalibrationRepository {
  @override
  Future<Either> getCalibrationDetails(ParamsAsType? params) {
    return sl<GetCalibrationDetailApiService>().getCalibrationDetails(params);
  }
}
