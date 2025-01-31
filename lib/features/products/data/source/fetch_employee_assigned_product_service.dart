import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/products/data/models/response_assigned_employee_product_list.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';
import '../../../profile/data/model/request_employee_profile.dart';

abstract class FetchEmployeeAssignedProductsService {
  Future<Either> fetchEmpProduct(RequestEmployeeProfile params);
}

class FetchEmployeeAssignedProductsServiceImpl
    extends FetchEmployeeAssignedProductsService {
  @override
  Future<Either> fetchEmpProduct(RequestEmployeeProfile params) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.getAssignedProductInventory, data: params.toMap());
      var getEmployeeProfileResponse =
          ResponseAssignedEmployeeProductList.fromJson(response.data);
      return Right(getEmployeeProfileResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
