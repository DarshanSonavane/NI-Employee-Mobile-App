import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/customer_profile/domain/repository/fetch_customer_profile_repository.dart';

import '../../../../service_locator_dependecies.dart';

class FetchCustomerUsecase extends UseCase<Either, ParamsWithPage> {
  @override
  Future<Either> call({ParamsWithPage? params}) async {
    final page = params?.page ?? 1;
    return await sl<FetchCustomerProfileRepository>()
        .fetchCustomerRepository(page: page);
  }
}
