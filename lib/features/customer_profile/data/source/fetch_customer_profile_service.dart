import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_customer_profile.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class FetchCustomerProfileService {
  Future<Either> fetchCustomer({int page = 1});
}

class FetchCustomerProfileServiceImpl extends FetchCustomerProfileService {
  @override
  Future<Either> fetchCustomer({int page = 1}) async {
    try {
      var response = await sl<DioClient>()
          .get(ApiUrls.getAllCustomers, queryParameters: {'page': page});
      var responseCustomerProfile =
          ModelCustomerProfile.fromJson(response.data);
      return Right(responseCustomerProfile);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
