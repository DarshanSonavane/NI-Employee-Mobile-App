import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_customer_profile.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class FetchCustomerProfileService {
  Future<Either> fetchCustomer();
}

class FetchCustomerProfileServiceImpl extends FetchCustomerProfileService {
  @override
  Future<Either> fetchCustomer() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.getAllCustomers);
      var responseCustomerProfile =
          ModelCustomerProfile.fromJson(response.data);
      return Right(responseCustomerProfile);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
