import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_delete_customer_request.dart';
import 'package:employee_ni_service/features/customer_profile/data/model/model_delete_customer_response.dart';
import 'package:employee_ni_service/service_locator_dependecies.dart';

abstract class DeleteCustomerService {
  Future<Either> deleteCustomer(ModelDeleteCustomerRequest modelDeleteCustomer);
}

class DeleteCustomerServiceImpl extends DeleteCustomerService {
  @override
  Future<Either> deleteCustomer(
      ModelDeleteCustomerRequest modelDeleteCustomer) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.deleteCustomer, data: modelDeleteCustomer.toJson());
      var responseDeleteCustomer =
          ModelDeleteCustomerResponse.fromJson(response.data);
      return Right(responseDeleteCustomer);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
