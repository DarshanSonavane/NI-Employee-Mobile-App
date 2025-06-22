import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/customer_profile/domain/repository/fetch_customer_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchCustomerUsecase extends UseCase<Either, NoParams> {
  @override
  Future<Either> call({NoParams? params}) async {
    return await sl<FetchCustomerProfileRepository>().fetchCustomerRepository();
  }
}
