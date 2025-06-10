import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_add_machine/request_add_machine_model.dart';

import '../../../../service_locator_dependecies.dart';
import '../repository/add_machine_details_repository.dart';

class AddMachineDetailsUsecase extends UseCase<Either, RequestAddMachineModel> {
  @override
  Future<Either> call({RequestAddMachineModel? params}) async {
    return await sl<AddMachineDetailsRepository>().addMachineDetails(params!);
  }
}
