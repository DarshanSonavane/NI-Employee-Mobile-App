import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/employee_profile/domain/repository/delete_employee_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class DeleteProfileUsecase extends UseCase<Either, ParamsAsValue> {
  @override
  Future<Either> call({ParamsAsValue? params}) async {
    return await sl<DeleteEmployeeProfileRepository>()
        .deleteEmployeeProfile(params?.value);
  }
}
