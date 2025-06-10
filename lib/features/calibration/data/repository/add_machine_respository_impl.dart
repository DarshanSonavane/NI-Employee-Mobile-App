import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_add_machine/request_add_machine_model.dart';
import 'package:employee_ni_service/features/calibration/domain/repository/add_machine_details_repository.dart';

import '../../../../service_locator_dependecies.dart';
import '../source/add_machine_details_api_service.dart';

class AddMachineRespositoryImpl extends AddMachineDetailsRepository {
  @override
  Future<Either> addMachineDetails(
      RequestAddMachineModel requestAddMachineModel) {
    return sl<AddMachineDetailsApiService>()
        .addMachineDetails(requestAddMachineModel);
  }
}
