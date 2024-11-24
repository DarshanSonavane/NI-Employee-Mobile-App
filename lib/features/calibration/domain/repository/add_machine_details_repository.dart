import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_add_machine/request_add_machine_model.dart';

abstract class AddMachineDetailsRepository {
  Future<Either> addMachineDetails(
      RequestAddMachineModel requestAddMachineModel);
}
