import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_customer_profile.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

abstract class SearchCustomerProfileService {
  Future<Either> searchCustomer({required String query});
}

class SearchCustomerProfileServiceImpl implements SearchCustomerProfileService {
  @override
  Future<Either> searchCustomer({required String query}) async {
    try {
      final response = await sl<DioClient>()
          .get(ApiUrls.searchCustomer, queryParameters: {'searchKey': query});
      final data = ModelCustomerProfile.fromJson(response.data);
      return Right(data);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
