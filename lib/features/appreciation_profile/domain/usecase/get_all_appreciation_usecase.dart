import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/appreciation_profile/domain/repository/get_all_appreciation_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

class GetAllAppreciationUsecase extends UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) {
    return sl<GetAllAppreciationRepository>().getAllAppreciation();
  }
}
