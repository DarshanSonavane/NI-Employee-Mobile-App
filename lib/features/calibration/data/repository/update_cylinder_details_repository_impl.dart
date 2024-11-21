import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_update_cylinder/request_update_cylinder_details.dart';
import 'package:employee_ni_service/features/calibration/domain/repository/update_cylinder_details_repository.dart';
import '../../../../service_locator_dependecies.dart';
import '../source/update_cylinder_details_api_service.dart';

class UpdateCylinderDetailsRepositoryImpl
    extends UpdateCylinderDetailsRepository {
  @override
  Future<Either> updateCylinderDetails(
      RequestUpdateCylinderDetails requestUpdateCylinderDetails) {
    return sl<UpdateCylinderDetailsApiService>()
        .updateCylinderDetails(requestUpdateCylinderDetails);
  }
}
