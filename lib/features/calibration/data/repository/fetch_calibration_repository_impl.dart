import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/domain/repository/fetch_calibration_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/get_calibration_details_api_service_impl.dart';

class FetchCalibrationRepositoryImpl extends FetchCalibrationRepository {
  @override
  Future<Either> getCalibrationDetails() {
    return sl<GetCalibrationDetailApiService>().getCalibrationDetails();
  }
}
