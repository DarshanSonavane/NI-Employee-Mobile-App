import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:employee_ni_service/features/assign_product_by_admin/data/models/model_master_inventory.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependecies.dart';

abstract class GetMasterInventoryApiService {
  Future<Either> getMasterInventory();
}

class GetMasterInventoryApiServiceImpl extends GetMasterInventoryApiService {
  @override
  Future<Either> getMasterInventory() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.fetchMasterInventory);
      var getMasterInventoryResponse =
          ModelMasterInventory.fromJson(response.data);
      return Right(getMasterInventoryResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
