import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/features/appreciation_profile/data/source/get_all_appreciation_service.dart';
import 'package:employee_ni_service/features/appreciation_profile/domain/repository/get_all_appreciation_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

class GetAllAppreciationRepositoryImpl extends GetAllAppreciationRepository {
  @override
  Future<Either> getAllAppreciation() {
    return sl<GetAllAppreciationService>().getAllAppreciation();
  }
}
