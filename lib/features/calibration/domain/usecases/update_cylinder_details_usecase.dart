import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/calibration/data/model/model_update_cylinder/request_update_cylinder_details.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependecies.dart';
import '../repository/update_cylinder_details_repository.dart';

class UpdateCylinderDetailsUseCase
    implements UseCase<Either, RequestUpdateCylinderDetails> {
  @override
  Future<Either> call({RequestUpdateCylinderDetails? params}) async {
    return await sl<UpdateCylinderDetailsRepository>()
        .updateCylinderDetails(params!);
  }
}
