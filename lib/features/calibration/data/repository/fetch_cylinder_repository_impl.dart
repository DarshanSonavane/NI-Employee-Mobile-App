import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/source/get_cylinder_details_api_service.dart';
import 'package:employee_ni_service/features/calibration/domain/repository/fetch_cylinder_details_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchCylinderRepositoryImpl extends FetchCylinderDetailsRepository {
  @override
  Future<Either> getCylinderDetails() {
    return sl<GetCylinderDetailsApiService>().getCylinderDetails();
  }
}
