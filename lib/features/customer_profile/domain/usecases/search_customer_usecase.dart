import 'package:dartz/dartz.dart';
import 'package:employee_ni_service/core/usecase/use_case.dart';
import 'package:employee_ni_service/features/customer_profile/domain/repository/search_customer_profile_repository.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

class SearchCustomerUsecase extends UseCase<Either, ParamsAsValue> {
  @override
  Future<Either> call({ParamsAsValue? params}) async {
    final query = params?.value ?? "";
    return await sl<SearchCustomerProfileRepository>()
        .searchCustomerRepository(query);
  }
}
