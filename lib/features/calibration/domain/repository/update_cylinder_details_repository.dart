import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_update_cylinder/request_update_cylinder_details.dart';

abstract class UpdateCylinderDetailsRepository {
  Future<Either> updateCylinderDetails(
      RequestUpdateCylinderDetails requestUpdateCylinderDetails);
}
