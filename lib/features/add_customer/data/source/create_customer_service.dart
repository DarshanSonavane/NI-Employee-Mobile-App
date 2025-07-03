import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/core/constants/api_urls.dart';
import 'package:employee_ni_service/core/network/dio_client.dart';
import 'package:employee_ni_service/features/add_customer/data/model/model_add_customer.dart';
import 'package:employee_ni_service/features/add_customer/data/model/response_add_customer_modal.dart';

import '../../../../service_locator_dependecies.dart';

abstract class CreateCustomerService {
  Future<Either> createCustomer(ModelAddCustomer modelAddCustomer);
}

class CreateCustomerServiceImpl extends CreateCustomerService {
  @override
  Future<Either> createCustomer(ModelAddCustomer modelAddCustomer) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.createAndUpdateCustomer, data: modelAddCustomer);
      var responseAddedCustomer =
          ResponseAddCustomerModal.fromJson(response.data);
      return Right(responseAddedCustomer);
    } on DioException catch (e) {
      return Left(e);
    }
  }
}
