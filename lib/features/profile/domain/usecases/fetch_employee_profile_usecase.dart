import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/profile/data/model/request_employee_profile.dart';
import 'package:employee_ni_service/features/profile/domain/repository/employee_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchEmployeeProfileUsecase
    implements UseCase<Either, RequestEmployeeProfile> {
  @override
  Future<Either> call({RequestEmployeeProfile? params}) {
    return sl<EmployeeProfileRepository>().sendEmployeeId(params!);
  }
}
